// Configuration
int   BEARING_POSX   = 100,
      BEARING_POSY   = 100,
      BEARING_RADIUS = 16,

      CANNON_WIDTH   = getModel( 1 ),     // 1m
      CANNON_HEIGHT  = getModel( 3 ),     // 3m

      CANNON_POSX    = SILO_WIDTH - BEARING_RADIUS,

      CANNON_POSY    = GROUND_POSY - CANNON_HEIGHT - BEARING_RADIUS;

color BEARING_COLOR  = #EBC52D;


// Constructor
class Cannon implements Element {

  int posX, posY,
      bearingPosX, bearingPosY,
      angleMax, angleMin,
      rad,
      left;

  // ------------------------------------ //

  Cannon ( boolean side, int playerPosX ) {

    left  = side;

    posX  = side ? playerPosX + CANNON_POSX                 :
                   playerPosX - CANNON_POSX - CANNON_WIDTH;

    posY  = CANNON_POSY;


    bearingPosX = posX + CANNON_WIDTH/2;
    bearingPosY = posY + CANNON_HEIGHT;


    // too rigid with just 30° ?
    angleMin = side ? 15  : -45;     // left
    angleMax = side ? 45  : -15;     // right

    setAngle( 30.0 );
  }


    void setAngle ( float deg ) {

      rad = radians( left ? deg : TWO_PI - deg );
    }


    void increaseAngle() {

      int step = 1;

      step = degrees(rad) + step;

      if ( step > angleMax ) return;

      rad = radians( step );
    }

    void decreaseAngle() {

      int step = 1;

      step = degrees(rad) - step;

      if ( step < angleMin ) return;

      rad = radians( step );
    }


  // ------------------------------------ //

  void update ( float delta ) {


  }

  // ------------------------------------ //

  void draw(){


    pushMatrix();

      turn();

      fill( PLAYER_COLORS[ left ? 0 : 1 ] );

      rect( posX, posY, CANNON_WIDTH, CANNON_HEIGHT );

      fill( BEARING_COLOR );

      ellipse( bearingPosX, bearingPosY, BEARING_RADIUS, BEARING_RADIUS );

    popMatrix();
  }


    void turn() {

      translate( bearingPosX, bearingPosY );

      rotate( rad );

      translate( -bearingPosX, -bearingPosY );
    }
}
