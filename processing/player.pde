// Configuration

int BASE_OFFSET = 10;

int[] PLAYER_POSX = {

  BASE_OFFSET,
  SCREEN_WIDTH - BASE_OFFSET
};


colors[] PLAYER_COLORS = {

  #385E92,
  #92383A
};





// Constructor
class Player implements Element {


  int id,         // id of the player
      offset,     // x-offset
      num;        // amount of elements

  Elements[] elements;  // elements of the player


  // ------------------------------------ //


  Player ( int playerID ) {

    id      = playerID;
    offset  = PLAYER_POSX[ id ];

    this.init();
  }


  // ------------------------------------ //


  void init(){

    elements = {

      new Silo    ( !id, offset ), // e.g. 0 -> false -> ! -> true, first player -> left
      new Cannon  ( !id, offset ),
      new Wall    ( !id, offset )
    };
  }


  // ------------------------------------ //


  void update(){

    // num = elements.length;
    // while ( num-- ) elements[ num ].update();
  }


  // ------------------------------------ //


  void draw(){

    fill( PLAYER_COLORS[ id ] );

    num = elements.length;
    while ( num-- ) elements[ num ].draw();
  }


}


// variables: ~ public
// functions: this.
