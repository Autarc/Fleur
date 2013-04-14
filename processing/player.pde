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


  int id,             // id of the player
      playerPosX,     // x-offset
      numElements;    // amount of elements

  Elements[] elements;  // elements of the player

  // internal references
  Silo silo; Cannon cannon; Wall wall;


  // ------------------------------------ //


  Player ( int playerID ) {

    id          = playerID;
    playerPosX  = PLAYER_POSX[ id ];

    this.init();
  }


  // ------------------------------------ //


  void init(){

    silo    = new Silo    ( !id, playerPosX ); // e.g. 0 -> false -> ! -> true, first player -> left
    cannon  = new Cannon  ( !id, playerPosX );
    wall    = new Wall    ( !id, playerPosX );
    bullet  = new Bullet  ();

    elements = { silo, cannon, wall, bullet };
  }


    void shoot(){

      bullet.init( cannon );
    }

  // ------------------------------------ //


  void update(){

    numElements = elements.length;
    while ( numElements-- ) elements[ numElements ].update();
  }


  // ------------------------------------ //


  void draw(){

    fill( PLAYER_COLORS[ id ] );

    numElements = elements.length;
    while ( numElements-- ) elements[ numElements ].draw();
  }


}


// variables: ~ public
// functions: this.
