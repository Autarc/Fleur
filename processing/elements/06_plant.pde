// Configuration
float PLANT_HEIGHT  = 0.5,             // 0.5m

      PLANT_POSX    = -FIELD_SIZE/2,   // from both sides - starting from both sides
      PLANT_POSY    = PLANT_HEIGHT;

color PLANT_COLOR   = #FFCC00;


// Constructor
class Plant implements Element {

  int posX, width;

  boolean alive;

  // ------------------------------------ //

  Plant( int PLANT_WIDTH, float offset, int num ) {

    width = PLANT_WIDTH;

    posX = PLANT_POSX + offset + ( 2 * offset + width ) * num;

    alive = true;

    // onClick( 'Plant_' + num, [ posX, PLANT_POSY, width, PLANT_HEIGHT ], this.hit )
  }


    void hit(){

      alive = false;
      game.score.increase();
    }

  // ------------------------------------ //

  void update ( float delta ) {}

  // ------------------------------------ //

  void draw(){

    if ( !alive ) return;

    fill( PLANT_COLOR );

    // rect( drawX(posX), drawY(PLANT_POSY), getModel(width), getModel(PLANT_HEIGHT) );

    image( IMAGE_PLANT, drawX(posX), drawY(PLANT_POSY + 0.7) );
  }

}
