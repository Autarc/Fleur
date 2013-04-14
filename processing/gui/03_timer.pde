// Configuration
int   TIMER_SIZE    = 16,

      TIMER_POSX    = SCREEN_WIDTH/2 - 70, // ToDo: calculate letter-length * font-width
      TIMER_POSY    = GROUND_POSY + (TIMER_SIZE * 2);

color TIMER_COLOR = #ffffff;


// Constructor
class Timer implements Element {

  int counter;

  boolean ready;


	// ------------------------------------ //

	Timer() {

    String[] fontList = PFont.list();

    PFont font = createFont( fontList[0], TIMER_SIZE );

    textFont( font );

    ready = false;
	}


    void init ( int duration ) {

      counter = duration;

      ready = true;
    }

	// ------------------------------------ //

	void update ( float delta ) {

    if ( !ready ) return;

    if ( FRAME_COUNTER % FRAME_RATE == 0 ) {

      counter--;

      if ( counter == 0 ) lose();
    }
	}


    void lose(){

      ready = false;

      log('lost');
    }


	// ------------------------------------ //

	void draw(){

    if ( !ready ) return;

    fill( TIMER_COLOR );
    text( "Time Left:",           TIMER_POSX - 2 * TIMER_SIZE, TIMER_POSY );
    text( formatTime( counter ),  TIMER_POSX + 4 * TIMER_SIZE, TIMER_POSY );
	}

    String formatTime ( int time ) {

      int minutes     = floor(time/60),
          seconds     = time % 60;

      return  (minutes < 10 ? 0 : "") + minutes   + " : " +
              (seconds < 10 ? 0 : "") + seconds;
    }

}
