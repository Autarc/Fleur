// Configuration
int CANNON_WIDTH  = SILO_WIDTH/2,
    CANNON_HEIGHT = SILO_HEIGHT,

    CANNON_POSX   = SILO_WIDTH*2,

    CANNON_POSY   = GROUND_POSY - CANNON_HEIGHT;


// Constructor
class Cannon implements Element {


  int dx,     // x-offset
      rad,    // angle/degree
      left;

  // ------------------------------------ //

  Cannon ( boolean side, int offset ) {

    left  = side;

    dx    = side ? offset : ( offset - CANNON_WIDTH );


    float deg = 45.0;

    rad = radians( left ? deg : 2*PI - deg );
  }

  // ------------------------------------ //

  void update(){


  }

  // ------------------------------------ //

  void draw(){

    fill( PLAYER_COLORS[ left ? 0 : 1 ] );

    pushMatrix();

      // translate( SCREEN_WIDTH/2, SCREEN_HEIGHT/2 );

      // rotate( rad );

      // translate( -SCREEN_WIDTH/2, -SCREEN_HEIGHT/2 );

      rect( dx + ( left ? CANNON_POSX : -CANNON_POSX ),

            CANNON_POSY, CANNON_WIDTH, CANNON_HEIGHT );

    popMatrix();
  }

}
