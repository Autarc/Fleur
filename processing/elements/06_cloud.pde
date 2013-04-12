// Configuration
int   CLOUD_RADIUS   = 50,
      CLOUD_CENTERX  = (SCREEN_WIDTH/2 - CLOUD_RADIUS/2),
      CLOUD_CENTERY  = CLOUD_RADIUS;

color CLOUD_COLOR  = #698AEC;


// Constructor
class Cloud implements Element {


  // ------------------------------------ //

  Cloud(){


  }

  // ------------------------------------ //

  void update(){


  }

  // ------------------------------------ //

  void draw(){

    fill( CLOUD_COLOR );

    ellipse( CLOUD_CENTERX, CLOUD_CENTERY, CLOUD_RADIUS, CLOUD_RADIUS );
  }
}
