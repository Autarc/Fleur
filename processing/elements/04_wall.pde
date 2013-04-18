// Configuration
int   WALL_WIDTH  = getModel(   1 ),
      WALL_HEIGHT = getModel( 2.5 ),

      WALL_POSX   = CANNON_POSX + CANNON_WIDTH * 3,
      WALL_POSY   = GROUND_POSY - WALL_HEIGHT;

color WALL_COLOR  = #838053;


// Constructor
class Wall implements Element {

  int posX,
      left;

  // ------------------------------------ //

  Wall ( boolean side, int playerPosX ) {

    left  = side;

    posX  = side ?  playerPosX + WALL_POSX                  :
                    playerPosX - WALL_POSX - WALL_WIDTH;
  }

  // ------------------------------------ //

  void update ( float delta ) {

  }

  // ------------------------------------ //

  void draw(){

    fill( WALL_COLOR );

    rect( posX, WALL_POSY, WALL_WIDTH, WALL_HEIGHT );
  }

}
