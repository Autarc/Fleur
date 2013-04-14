// Configuration
int   PLANT_HEIGHT  = 20,

      PLANT_POSX    = WALL_POSX + WALL_WIDTH,
      PLANT_POSY    = GROUND_POSY - PLANT_HEIGHT;

color PLANT_COLOR   = #FFCC00;


// Constructor
class Plant implements Element {


  int posX, width;

  // ------------------------------------ //

  Plant( int PLANT_WIDTH, int num ) {

    width = PLANT_WIDTH;

    int offset = floor(width/2);

    posX = PLANT_POSX + offset + ( 2 * offset + width ) * num;
  }

  // ------------------------------------ //

  void update ( float delta ) {


  }

  // ------------------------------------ //

  void draw(){

    fill( PLANT_COLOR );

    rect( posX, PLANT_POSY, width, PLANT_HEIGHT );
  }
}
