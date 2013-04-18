// Configuration
int   PLANT_HEIGHT  = getModel( 0.5 ),            // 0.5m

      PLANT_POSX    = WALL_POSX + WALL_WIDTH,
      PLANT_POSY    = GROUND_POSY - PLANT_HEIGHT;

color PLANT_COLOR   = #FFCC00;


// Constructor
class Plant implements Element {


  int posX, width;

  boolean alive;

  // ------------------------------------ //

  Plant( int PLANT_WIDTH, int num ) {

    width = PLANT_WIDTH;

    int offset = floor(width/2);

    posX = PLANT_POSX + offset + ( 2 * offset + width ) * num;

    alive = true;

    onClick( 'Plant_' + num, [ posX, PLANT_POSY, width, PLANT_HEIGHT ], this.hit )
  }


    void hit(){

      alive = false;
      game.score.increase();
    }

  // ------------------------------------ //

  void update ( float delta ) {


  }

  // ------------------------------------ //

  void draw(){

    if ( !alive ) return;

    fill( PLANT_COLOR );

    rect( posX, PLANT_POSY, width, PLANT_HEIGHT );
  }
}
