// Configuration
int   DECISION_RATE	= 180;		// 3 minutes - game time...

int   TIMER_SIZE    = 16,

      TIMER_POSX    = SCREEN_WIDTH/2 - 70, // ToDo: calculate letter-length * font-width
      TIMER_POSY    = GROUND_POSY + (TIMER_SIZE * 2);

color TIMER_COLOR = #ffffff;


// Constructor
class Timer implements Element {


	// ------------------------------------ //

	Timer() {

    String[] fontList = PFont.list();

    PFont font = createFont( fontList[0], TIMER_SIZE );

    textFont( font );
	}

	// ------------------------------------ //

	void update(){


	}

	// ------------------------------------ //

	void draw(){

    fill( TIMER_COLOR );
    text('Time Left: 2:15', TIMER_POSX, TIMER_POSY );
	}

}
