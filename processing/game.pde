// Configuration
int   SCREEN_WIDTH    = 800,
      SCREEN_HEIGHT   = 400,

      FRAME_RATE      =  20;


color GAME_COLOR_BACKGROUND = #eeeeee;


// Constructor
class Game {


  int   numPlayers,   // amount of players
        numElements,  // amount of elements
        numGUI;       // amount of gui parts

  Player[]    players;  // different players
  Elements[]  elements; // neutral elements
  Elements[]  gui;


  // ------------------------------------ //


  Game(){

    this.setup();
    this.init();
    this.addEventHandler();
  }


  // ------------------------------------ //

  void setup(){

    size( SCREEN_WIDTH, SCREEN_HEIGHT );
    frameRate( FRAME_RATE );


    clear();
  }

  // ------------------------------------ //


  void init(){

    createElements();
    createPlayers();
    createGUI();
  }


    void createElements(){

      elements = {

        new Ground(),
        new Cloud(),


        // setup - menu
        new Plant(0),
        new Plant(1),
        new Plant(2)
      };
    }


    void createPlayers(){

      num   = 2;

      players = new Player[ num ];

      for ( int i = 0; i < num; i++ ) {

        players[ i ] = new Player( i );
      }
    }


    void createGUI(){

      gui = {

        new Timer(),
        new Score()
      };
    }




  // ------------------------------------ //

  void addEventHandler(){

    // see events.pde
    // button handler
    // schub regler
    // (*) menu ?
  }


  // ------------------------------------ //

  void render(){

    clear();

    update();

    draw();
  }

    void update(){

      // numElements = elements.length;
      // while ( numElements-- ) elements[ numElements ].update();

      // while ( numPlayers-- ) players[ numPlayers ].update();
      // numPlayers = players.length;

      // numGUI = gui.length;
      // while ( numGUI-- ) gui[ numGUI ].update();
    }


    void draw(){

      numElements = elements.length;
      while ( numElements-- ) elements[ numElements ].draw();

      while ( numPlayers-- ) players[ numPlayers ].draw();
      numPlayers = players.length;

      numGUI = gui.length;
      while ( numGUI-- ) gui[ numGUI ].draw();
    }



  // ------------------------------------ //


  void clear(){

    background( GAME_COLOR_BACKGROUND );
  }
}
