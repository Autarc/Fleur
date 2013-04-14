// Configuration
int CANNON_WIDTH  = SILO_WIDTH/2,
    CANNON_HEIGHT = SILO_HEIGHT,

    CANNON_POSX   = SILO_WIDTH*2,

    CANNON_POSY   = GROUND_POSY - CANNON_HEIGHT;


// Constructor
class Cannon implements Element {

  int posX, posY,
      rad,
      left;

  // ------------------------------------ //

  Cannon ( boolean side, int playerPosX ) {

    left  = side;

    posX  = side ? playerPosX + CANNON_POSX                 :
                   playerPosX - CANNON_POSX - CANNON_WIDTH;

    posY  = CANNON_POSY;

    setAngle( 55.0 );
  }


    void setAngle ( float deg ) {

      rad = radians( left ? deg : TWO_PI - deg );
    }


    void increaseAngle() {

      int step = 1;

      rad = radians( degrees(rad) + step );
    }

    void decreaseAngle() {

      int step = 1;

      rad = radians( degrees(rad) - step );
    }


  // ------------------------------------ //

  void update ( float delta ) {


  }

  // ------------------------------------ //

  void draw(){

    fill( PLAYER_COLORS[ left ? 0 : 1 ] );

    pushMatrix();

      // ToDo:
      //
      //  - Check why second player got higher ....
      //  - still false drawing/moving,as not rotate around the center.... ?

      turn();

      rect( posX, posY, CANNON_WIDTH, CANNON_HEIGHT );

    popMatrix();
  }


    void turn() {

      translate( posX, posY );

      rotate( rad );

      translate( -posX, -posY );
    }
}
