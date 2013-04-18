// Configuration
int   SILO_WIDTH      = getModel( 2 ),          // 1.5m = 60px
      SILO_HEIGHT     = getModel( 5 ),          //getReal(100),

      SILO_POSY       = GROUND_POSY - SILO_HEIGHT,

      WATER_WIDTH     = SILO_WIDTH/2,
      WATER_HEIGHT    = (SILO_HEIGHT/10) * 9,

      WATER_POSX      = WATER_WIDTH/2;

color SILO_COLOR      = #35383A,
      WATER_COLOR     = #004970;


// Constructor
class Silo implements Element {

  int posX,
      left;


  // ------------------------------------ //

  Silo ( boolean side, int playerPosX ) {

    left = side;

    posX = side ? playerPosX                :
                  playerPosX - SILO_WIDTH;
  }


  // ------------------------------------ //

  void update ( float delta ) {


  }

  // ------------------------------------ //

  void draw(){

    fill( SILO_COLOR );
    rect( posX, SILO_POSY, SILO_WIDTH, SILO_HEIGHT );

    fill( WATER_COLOR );
    rect( posX + WATER_POSX, SILO_POSY, WATER_WIDTH, WATER_HEIGHT );
  }
}
