// Configuration
int   GROUND_WIDTH    = SCREEN_WIDTH,
      GROUND_HEIGHT   = 100,
      GROUND_POSX     = 0,
      GROUND_POSY     = SCREEN_HEIGHT-GROUND_HEIGHT;

color GROUND_COLOR    = #010D01;


// Constructor
class Ground implements Element {


  Ground(){


  }


  // ------------------------------------ //

  void update(){


  }

  // ------------------------------------ //

  void draw(){

    fill( GROUND_COLOR );

    rect( GROUND_POSX, GROUND_POSY, GROUND_WIDTH, GROUND_HEIGHT );
  }

}
