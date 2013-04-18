// Configuration
int   CLOUD_RADIUS  = getModel( 2 ),        // 2m

      CLOUD_CENTERX = SCREEN_WIDTH/2,
      CLOUD_CENTERY = CLOUD_RADIUS;

color CLOUD_COLOR   = #698AEC;


// Constructor
class Cloud implements Element {


  // ------------------------------------ //

  Cloud(){}

  // ------------------------------------ //

  void update ( float delta ) {


  }

  // ------------------------------------ //

  void draw(){

    fill( CLOUD_COLOR );

    ellipse( CLOUD_CENTERX, CLOUD_CENTERY, CLOUD_RADIUS, CLOUD_RADIUS );
  }
}
