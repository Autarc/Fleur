// Configuration
float BEARING_RADIUS = 0.5,
      BEARING_POSY   = 1,

      CANNON_WIDTH   = 1,                       // 1m
      CANNON_HEIGHT  = 3,                       // 3m

      CANNON_POSX    = SILO_WIDTH - BEARING_RADIUS,
      CANNON_POSY    = CANNON_HEIGHT + BEARING_RADIUS,

      POWER_OFFSET_X = 1,
      POWER_OFFSET_Y = 1;

color BEARING_COLOR  = #EBC52D,
      POWER_COLOR    = #000000;




// Constructor
class Cannon implements Element {

  int     posX, posY,
          bearingPosX, bearingPosY,
          powerX, powerY;

  float   angleMax, angleMin,
          rad, power;

  boolean left,
          charging;

  // ------------------------------------ //

  Cannon ( boolean side, int playerPosX ) {

    left  = side;

    // cannon
    posX  = side ? playerPosX + CANNON_POSX                 :
                   playerPosX - CANNON_POSX - CANNON_WIDTH;

    posY  = CANNON_POSY;

    // bearing
    bearingPosX = posX + CANNON_WIDTH/2;
    bearingPosY = posY - CANNON_HEIGHT;

    // power
    powerX = left ? posX + POWER_OFFSET_X                   :
                    posX - POWER_OFFSET_X;


    powerY = posY + POWER_OFFSET_Y;


    // too rigid with just 30° ?
    angleMin = side ? 15  : -45;
    angleMax = side ? 45  : -15;

    setAngle( 30.0 );
    setPower( DEFAULT_POWER );
  }

    // ------------------------------------ //

    // ToDo: add mouse control

    void setAngle ( float deg ) {

      rad = radians( left ? deg : -deg );
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

    void setPower ( float charge ) {

      charging = false;

      power = charge;
    }

    void increasePower ( int step ){

      if ( !step ) step = 2;

      if ( !charging ) charging = true;

      power += step;
    }

    // void decreasePower ( step ) {

    //   if ( !step ) step = 2;

    //   power -= step;
    // }


  // ------------------------------------ //

  void update ( float delta ) {}

  // ------------------------------------ //

  void draw(){

    pushMatrix();

      turn();

      fill( PLAYER_COLORS[ left ? 0 : 1 ] );

      rect( drawX(posX), drawY(posY), getModel(CANNON_WIDTH), getModel(CANNON_HEIGHT) );

      fill( BEARING_COLOR );

      ellipse( drawX(bearingPosX), drawY(bearingPosY), getModel(BEARING_RADIUS), getModel(BEARING_RADIUS) );

    popMatrix();


    // showing the current power
    if ( !charging ) return;

    fill( POWER_COLOR );

    text( power + ' m/s²', drawX( powerX ), drawY( powerY ) );
  }


    void turn() {

      translate( drawX(bearingPosX), drawY(bearingPosY) );

      rotate( rad );

      translate( -drawX(bearingPosX), -drawY(bearingPosY) );
    }
}
