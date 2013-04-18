// Configuration
int		BULLET_RADIUS	= getModel( 0.5 );       // 0.5m
color	BULLET_COLOR	= #00CCFF;


// Constructor
class Bullet implements Element {


  int posX, posY,
      rad,
      left;

  boolean ready;

  // ------------------------------------ //

	Bullet() {

    ready = false;
	}


    void init ( Cannon cannon ){

      posX  = cannon.posX;// * cannon.rad;
      posY  = cannon.posY;// * cannon.rad;

      rad   = cannon.rad;
      left  = cannon.left;

      ready = true;
    }



  // ------------------------------------ //

	void update ( float delta ) {

    if ( !ready ) return;

    calculateCurve( delta );
	}


    void calculateCurve ( delta ) {

        posX += left ? 1 : -1;
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
