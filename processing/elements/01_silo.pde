// Configuration
float SILO_WIDTH      = 2,
      SILO_HEIGHT     = 5,

      SILO_POSY       = SILO_HEIGHT,

      EMPTY_WIDTH     = SILO_WIDTH/2,
      EMPTY_HEIGHT    = (SILO_HEIGHT/10) * 9,

      EMPTY_POSX      = EMPTY_WIDTH/2;

color SILO_COLOR      = #35383A,
      EMPTY_COLOR     = #555A5D,
      WATER_COLOR     = #004970;


// Constructor
class Silo implements Element {

  int posX,

      waterPosX,
      waterPosY,
      waterHeight;

  boolean left;

  // ------------------------------------ //

  Silo ( boolean side, int playerPosX ) {

    left = side;

    posX = side ? playerPosX                :
                  playerPosX - SILO_WIDTH;

    init();
  }

  void init(){

    waterPosX   = posX + EMPTY_POSX
    waterPosY   = SILO_POSY;
    waterHeight = EMPTY_HEIGHT;
  }


  void reduceHeight ( step ) {

    if ( waterHeight < 0 ) return;

    if ( !step ) step = 2;

    float diff = ( EMPTY_HEIGHT / MAX_POWER ) * step; // 100%

    waterPosY   -= diff;
    waterHeight -= diff;
  }



  // ------------------------------------ //

  void update ( float delta ) {}

  // ------------------------------------ //

  void draw(){

    fill( SILO_COLOR );
    rect( drawX(posX), drawY(SILO_POSY), getModel(SILO_WIDTH), getModel(SILO_HEIGHT) );

    fill( EMPTY_COLOR );
    rect( drawX(waterPosX), drawY(SILO_POSY), getModel(EMPTY_WIDTH), getModel(EMPTY_HEIGHT) );

    fill( WATER_COLOR );
    rect( drawX( waterPosX), drawY(waterPosY), getModel(EMPTY_WIDTH), getModel(waterHeight) );
  }
}
