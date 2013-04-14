// Configuration
int   SCREEN_WIDTH    = 800,
      SCREEN_HEIGHT   = 400,

      FRAME_RATE      =  60,
      FRAME_COUNTER   =   0;


color GAME_COLOR_BACKGROUND = #eeeeee;


// Difficulty
int   DIFFICULTY_PLANTS = 3,
      DIFFICULTY_TIME   = DIFFICULTY_PLANTS * 60;




// Constructor
class Game {

  int         numPlayers,   // amount of players
              numElements,  // amount of elements
              numGUI;       // amount of gui parts

  Player[]    players;      // different players
  Elements[]  elements;     // neutral elements
  Elements[]  gui;

  // internal
  Cloud       cloud;
  Field       field;
  Player      currentPlayer;
  Timer       timer;
  Score       score;



  // ------------------------------------ //


  Game(){

    this.setup();
    this.init();
    this.addEventHandler();

    // this.start();
  }


  // ------------------------------------ //

  void setup(){

    size( SCREEN_WIDTH, SCREEN_HEIGHT );
    frameRate( FRAME_RATE );

    noStroke();

    clear();
  }

  // ------------------------------------ //


  void init(){

    createElements();
    createPlayers();
    createGUI();
  }


    void createElements(){

      cloud = new Cloud();

      field = new Field();

      elements = { new Ground(), cloud, field };
    }


    void createPlayers(){

      num     = 2;

      players = new Player[ num ];

      for ( int i = 0; i < num; i++ ) {

        players[ i ] = new Player( i );
      }

      currentPlayer = players[ 0 ];
    }


    void createGUI(){

      timer = new Timer();
      score = new Score();

      gui = { timer, score };
    }




  // ------------------------------------ //

  void addEventHandler(){

    // Mouse:
    // Handler will be attach on the specific object


    // Keyboard:
    onKey('ENTER', start );

    onKey('LEFT',  test_left  );
    onKey('RIGHT', test_right );
    onKey('SPACE', test_space );
  }


    void test_left(){  currentPlayer.cannon.increaseAngle();  }
    void test_right(){ currentPlayer.cannon.decreaseAngle();  }
    void test_space(){ currentPlayer.shoot();                 }

  // ------------------------------------ //

  void start(){

    field.init( DIFFICULTY_PLANTS );
    score.init( DIFFICULTY_PLANTS );
    timer.init( DIFFICULTY_TIME   );
  }


  // ------------------------------------ //

  void render(){

    FRAME_COUNTER++;

    float dt = frameCount;// 1/frameCount;

    update( dt );

    clear();

    draw();
  }


    void update ( float delta ) {

      numElements = elements.length;
      while ( numElements-- ) elements[ numElements ].update( delta );

      while ( numPlayers-- ) players[ numPlayers ].update( delta );
      numPlayers = players.length;

      numGUI = gui.length;
      while ( numGUI-- ) gui[ numGUI ].update( delta );
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
