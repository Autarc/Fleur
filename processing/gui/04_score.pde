// Configuration
int   SCORE_SIZE    = 16,

      SCORE_POSX    = SCREEN_WIDTH/2 - 30,
      SCORE_POSY    = TIMER_POSY + (TIMER_SIZE * 2);

color SCORE_COLOR = #cccccc;//#FFCC00;


// Constructor
class Score implements Element {


  int dx;

  // ------------------------------------ //

  Score () {

    String[] fontList = PFont.list();

    PFont font = createFont( fontList[0], TIMER_SIZE );

    textFont( font );
  }

  // ------------------------------------ //

  void update(){

  }

  // ------------------------------------ //

  void draw(){

    fill( SCORE_COLOR );

    text('0 / 3', SCORE_POSX, SCORE_POSY );
  }
}
