// Configuration
int		BULLET_RADIUS	= 30;
color	BULLET_COLOR	= #00CCFF;


// Constructor
class Bullet implements Element {

  boolean ready;

  int posX,
      posY;

  // ------------------------------------ //

	Bullet() {

    ready = false;
	}

    void init ( Cannon cannon ){

      posX  = cannon.posX;
      posY  = cannon.posY;

      rad   = cannon.rad;

      ready = true;
    }



  // ------------------------------------ //

	void update ( float delta ) {

    if ( !ready ) return;

    calculateCurve( delta );
	}


    void calculateCurve ( delta ) {

        posX += 1;
        posY -= 1;

        checkCleanUp();
    }


    // prevent rendering (negotiation didn't worked...)
    void checkCleanUp(){

      if (  posX < 0              ||
            posX > SCREEN_WIDTH   ||
            posY < 0              ||
            posY > SCREEN_HEIGHT    ) {

        game.currentPlayer = game.players[ ( game.currentPlayer.id == 0 ) ? 1 : 0 ]

        ready = false;
      }
    }


  // ------------------------------------ //

	void draw(){

    if ( !ready ) return;

    fill( BULLET_COLOR );

    ellipse( posX, posY, BULLET_RADIUS, BULLET_RADIUS );
	}

}
