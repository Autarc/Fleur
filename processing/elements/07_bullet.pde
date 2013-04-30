// Configuration
float	BULLET_RADIUS	= 0.5;       // 0.5m
color	BULLET_COLOR	= #00CCFF;


// Constructor
class Bullet implements Element {

  int posX0, posY0, posX, posY,

      radius,

      endLength;

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

      // initial velocity
      float vel0 = sqrt( cannon.power );

      vx0 = vel0 * sin( rad );
      vy0 = vel0 * cos( rad );

      setPosition( cannon.posX, cannon.posY, cannon.bearingPosX, cannon.bearingPosY );

      create  = true;
      ready   = true;
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
    checkOutOfScreen();
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

      posX = getPosX( delta );
      posY = getPosY( delta );

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

      if ( ! ( posX - radius < cloud.posX - cloud.radius ||
               posX + radius > cloud.posX + cloud.radius ||
               posY - radius < cloud.posY - cloud.radius ||
               posY + radius > cloud.posY + cloud.radius   ) ) {

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


    // prevent rendering (negotiation didn't worked...)
    void checkOutOfScreen(){

      if (  posX          < -( RANGE + 1 )  ||
            posX          >    RANGE + 1    ||
            posY          < 0               ||
            posY + radius > WORLD_HEIGHT       ) {

        // ToDo: print label "miss"

        clearChanges();
      }
    }

  // ------------------------------------ //

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
