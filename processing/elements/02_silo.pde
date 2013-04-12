// Configuration
int   SILO_WIDTH      =  60,
      SILO_HEIGHT     = 100,

      SILO_POSY       = GROUND_POSY - SILO_HEIGHT,

      WATER_WIDTH     = SILO_WIDTH/2,
      WATER_HEIGHT    = (SILO_HEIGHT/10) * 9;

color SILO_COLOR      = #35383A,
      WATER_COLOR     = #004970;


// Constructor
class Silo implements Element {

  int dx,
      left;


  // ------------------------------------ //

  Silo ( boolean side, int offset ) {

    left = side;

    dx   = side ? offset : ( offset - SILO_WIDTH );
  }

  // ------------------------------------ //

  void update(){


  }

  // ------------------------------------ //

  void draw(){

    fill( SILO_COLOR );
    rect( dx, SILO_POSY, SILO_WIDTH, SILO_HEIGHT );

    fill( WATER_COLOR );
    rect( dx + WATER_WIDTH/2, SILO_POSY, WATER_WIDTH, WATER_HEIGHT );
  }
}
