// Configuration
int   WALL_WIDTH  = SILO_WIDTH,
      WALL_HEIGHT = SILO_HEIGHT/2,

      WALL_POSX   = CANNON_POSX + CANNON_WIDTH,

      WALL_POSY   = GROUND_POSY - WALL_HEIGHT;

color WALL_COLOR  = #838053;


// Constructor
class Wall implements Element {

  int dx,
      left;

  // ------------------------------------ //

  Wall ( boolean side, int offset ) {

    left  = side;

    dx    = side ? offset : ( offset - WALL_WIDTH );
  }

  // ------------------------------------ //

  void update(){


  }

  // ------------------------------------ //

  void draw(){

    fill( WALL_COLOR );

    rect( dx + ( left ? WALL_POSX : -WALL_POSX ),

          WALL_POSY, WALL_WIDTH, WALL_HEIGHT );
  }

}
