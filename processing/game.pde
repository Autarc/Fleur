// Configurations
color GAME_COLOR_BACKGROUND = #eeeeee;


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

    this.start();
  }


  // ------------------------------------ //

  void setup(){

    size( SCREEN_WIDTH, SCREEN_HEIGHT );
    frameRate( FRAME_RATE );

    smooth();

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

      elements = { field, cloud, new Ground() };
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

      gui = { score, timer }; // reverse execution
    }




  // ------------------------------------ //

  void addEventHandler(){

    // Mouse:
    // Handler will be attach on the specific object


    // Keyboard:
    onPress('ENTER', start );
    onPress('1',     test_debug );

    onPress('LEFT',  test_left  );
    onPress('RIGHT', test_right );

    onRelease('SPACE', test_charge, test_shoot );
  }

    void test_debug() { debug = !debug };
    void test_left()  { currentPlayer.cannon.decreaseAngle();  }
    void test_right() { currentPlayer.cannon.increaseAngle();  }

    void test_charge() {  currentPlayer.charge();    }
    void test_shoot()  {  currentPlayer.shoot();    }





  // ------------------------------------ //

  void start(){

    field.init( DIFFICULTY_PLANTS );
    score.init( DIFFICULTY_PLANTS );
    timer.init( DIFFICULTY_TIME   );
  }


  // ------------------------------------ //

  void render(){

    TIME_COUNTER++;
    FRAME_COUNTER++;

    // time since beginning
    float delta = getTime( 1/frameRate ) * FRAME_COUNTER;

    update( delta );

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

      if ( debug ) debugDraw();
    }


  // ------------------------------------ //

  void switchPlayers(){

    currentPlayer = players[ ( currentPlayer.id == 0 ) ? 1 : 0 ];

    currentPlayer.silo.init();

    currentPlayer.cannon.setPower( DEFAULT_POWER );

    currentPlayer.bullet.clearChanges();
  }


  // ------------------------------------ //

  void clear(){

    background( GAME_COLOR_BACKGROUND );
  }
}
