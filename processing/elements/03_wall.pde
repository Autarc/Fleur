// Configuration
float WALL_WIDTH  = 1,
      WALL_HEIGHT = ( CANNON_HEIGHT / 4 ) * 3,

      WALL_POSX   = CANNON_POSX + CANNON_WIDTH + WALL_WIDTH * 2,
      WALL_POSY   = WALL_HEIGHT;

color WALL_COLOR  = #838053;


// Constructor
class Wall implements Element {

  int posX;

  boolean left;

  // ------------------------------------ //

  Wall ( boolean side, int playerPosX ) {

    left  = side;

    posX  = side ?  playerPosX + WALL_POSX                  :
                    playerPosX - WALL_POSX - WALL_WIDTH;
  }

  // ------------------------------------ //

  void update ( float delta ) {}

  // ------------------------------------ //

  void draw(){

    fill( WALL_COLOR );

    rect( drawX(posX), drawY(WALL_POSY), getModel(WALL_WIDTH), getModel(WALL_HEIGHT) );
  }

}
