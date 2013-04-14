// Configuration
int   SCORE_SIZE    = 16,

      SCORE_POSX    = SCREEN_WIDTH/2 - 30,
      SCORE_POSY    = TIMER_POSY + (TIMER_SIZE * 2);

color SCORE_COLOR   = #cccccc;


// Constructor
class Score implements Element {

  int posX, currentScore, maxScore;

  boolean ready;

  // ------------------------------------ //

  Score () {

    String[] fontList = PFont.list();

    PFont font = createFont( fontList[0], TIMER_SIZE );

    textFont( font );

    ready = false;
  }

    void init( int SCORE_MAX ){

      currentScore = 0;

      maxScore = SCORE_MAX;

      ready = true;
    }

  // ------------------------------------ //

  void update ( float delta ) {

  }

  // ------------------------------------ //

  void draw(){

    if ( !ready ) return;

    fill( SCORE_COLOR );
    text( currentScore + " / " + maxScore, SCORE_POSX, SCORE_POSY );
  }
}
