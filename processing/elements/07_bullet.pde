// Configuration
float	BULLET_RADIUS	= 0.5;       // 0.5m
color	BULLET_COLOR	= #00CCFF;


// distance between 2 points
float CONTACT_CLOUD  = BULLET_RADIUS/2 + CLOUD_RADIUS/2,
      CONTACT_GROUND = BULLET_RADIUS/2;


// Constructor
class Bullet implements Element {

  int posX0, posY0, posX, posY,

      radius,

      endLength,

      dir, col;

  ArrayList stepListX, stepListY;

  float rad, vx0, vy0;

  boolean left, ready, create;

  Cloud cloud;

  // ------------------------------------ //

	Bullet() {

    stepListY = new ArrayList();
    stepListX = new ArrayList();

    ready = false;
  }


    void init ( Cannon cannon ) {

      // not accessible in the constructor...
      cloud = game.cloud;

      radius = BULLET_RADIUS;

      left  = cannon.left;
      rad   = cannon.rad;

      dir  = 1;
      col  = 0;

      // initial velocity
      float vel0 = sqrt( cannon.power );

      vx0 = vel0 * sin( rad );
      vy0 = vel0 * cos( rad );

      setPosition( cannon.posX, cannon.posY, cannon.bearingPosX, cannon.bearingPosY );

      create  = true;
      ready   = true;

      tracks['bullet'].play();
    }

      // initial rotation around the bearing
      void setPosition( int px, int py, int ox, int oy ){

        px += radius;

        int dx = px - ox,
            dy = py - oy;

        posX0  = cos( rad ) * dx + sin( rad ) * dy + ox; // not -sin ...
        posY0  = sin( rad ) * dx + cos( rad ) * dy + oy;
      }

  // ------------------------------------ //


	void update ( float delta ) {

    if ( !ready ) return;

    if ( !create ) {

      removeAnimation();
      return;
    }

    definePath( delta );

    checkCollision();
	}


  // ------------------------------------ //

    void removeAnimation(){

      stepListX.remove(0);
      stepListY.remove(0);

      cloud.volumeIncrease( endLength );

      if ( stepListX.size() === 0 ) clearChanges();
    }

  // ------------------------------------ //

    void definePath ( float delta ) {

      posX = getPosX( delta ) * dir;
      posY = getPosY( delta );

      if ( dir == -1 ) posX += col;

      stepListX.add( posX );
      stepListY.add( posY );
    }

  // ------------------------------------ //

    int getPosX ( float t ) {

      return posX0 + vx0 * t;
    }


    int getPosY ( float t ) {

      return posY0 + vy0 * t - GRAVITY * (t*t) / 2;
    }


  // ------------------------------------ //

    void checkCollision(){

      checkGround();

      checkCloud();

      checkWall();
    }


      void checkGround(){

        if ( posY + radius/2 <= CONTACT_GROUND ) {

          showCollision();
        }
      }


      void checkCloud(){

        float distance  = dist( posX, posY, cloud.posX, cloud.posY );

        if ( distance <= CONTACT_CLOUD ) {

          tracks['bullet'].pause();
          tracks['cloud'].play();

          create = false;

          endLength = stepListX.size();

          if ( game.field.plants[0].alive ) {

             game.field.plants[0].hit();

          } else if ( game.field.plants[1].alive ) {

            game.field.plants[1].hit();

          } else {

            game.field.plants[2].hit()
          }
        }

      }

      void checkWall(){

        int x1Wall = game.players[ game.currentPlayer.id == 0 ? 1 : 0 ].wall.posX,  // own
            x2Wall = game.currentPlayer.wall.posX,                                  // other
            yWall  = WALL_HEIGHT;

        // reflection
        if ( posY - radius/2 <= yWall ) {

          if ( !game.currentPlayer.cannon.left ) {

            if ( posX + radius/2 <= x1Wall + WALL_WIDTH ) showCollision(); // own
            if ( posX + radius/2 >= x2Wall )              reflectX();     // other

          } else {

            // posX - radius/2 < x1Wall &&
            if ( posX - radius/2 >= x1Wall - WALL_WIDTH ) showCollision(); // own
            if ( posX - radius/2 <= x2Wall + WALL_WIDTH ) reflectX();     // other
          }
        }

      }

        // wall
        void reflectX(){

          tracks['bullet'].pause();
          tracks['wall'].play();

          col = 2 * posX;
          dir = -1;
        }

  // ------------------------------------ //


    void showCollision(){

      log(' x: ' + floor(posX) + ' | y: ' + floor(posY) );

      tracks['bullet'].pause();
      tracks['ground'].play();

      clearChanges();
    }


    void clearChanges(){

      // reset lists
      while ( stepListX.size() ) { stepListX.remove(0); stepListY.remove(0);  }

      create  = true;
      ready   = false;
    }


  // ------------------------------------ //

	void draw(){

    if ( !ready ) return;

    fill( BULLET_COLOR );

    int numSteps = stepListX.size();
    for ( int i = 0; i < numSteps; i++ ) {

      ellipse( drawX( stepListX.get(i) ), drawY( stepListY.get(i) ),
               getModel(BULLET_RADIUS), getModel(BULLET_RADIUS) );
    }

	}

}
