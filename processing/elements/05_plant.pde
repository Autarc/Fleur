// Configuration
int   PLANT_WIDTH   = 50,
      PLANT_HEIGHT  = 20,

      PLANT_POSX    = (SCREEN_WIDTH/6)*2, // temp value
      PLANT_POSY    = GROUND_POSY - PLANT_HEIGHT;

color PLANT_COLOR   = #FFCC00;


// Constructor
class Plant implements Element {

  int dx;

  // ------------------------------------ //

  Plant( int num ) {

    dx = num * PLANT_WIDTH * 2;
  }

  // ------------------------------------ //

  void update(){


  }

  // ------------------------------------ //

  void draw(){

    fill( PLANT_COLOR );

    rect( PLANT_POSX + dx, PLANT_POSY, PLANT_WIDTH, PLANT_HEIGHT );
  }
}
