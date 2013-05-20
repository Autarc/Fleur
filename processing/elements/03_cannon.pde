// Configuration
float BEARING_RADIUS = 0.5,

      CANNON_WIDTH   = 0.7,                       // 1m
      CANNON_HEIGHT  = 2.5,                       // 3m

      CANNON_POSX    = CART_OFFSET + SILO_WIDTH    - BEARING_RADIUS,
      CANNON_POSY    = CART_POSY   + CANNON_HEIGHT + BEARING_RADIUS,

      POWER_OFFSET_X = 1,
      POWER_OFFSET_Y = 1,

      RAD_OFFSET_X   =  1.25,
      RAD_OFFSET_Y   = -2.75;

color BEARING_COLOR  = #EBC52D,
      POWER_COLOR    = #000000;


// Constructor
class Cannon implements Element {

  int     id,
          posX, posY,
          bearingPosX, bearingPosY,
          powerX, powerY,
          radX, radY,

          duration;     // duration of the charging/water shot

  float   angleMax, angleMin,
          rad, power,

          distance;     // distance of the feedback

  boolean left,
          charging,
          active;

  // ------------------------------------ //

  Cannon ( boolean side, int playerPosX, int playerId ) {

    id    = playerId;

    left  = side;

    // cannon
    posX  = side ? playerPosX + CANNON_POSX                 :
                   playerPosX - CANNON_POSX - CANNON_WIDTH;

    posY  = CANNON_POSY;

    // bearing
    bearingPosX = posX + CANNON_WIDTH/2;
    bearingPosY = posY - CANNON_HEIGHT;

    // power
    powerX   = left ? posX + POWER_OFFSET_X  :
                      posX - POWER_OFFSET_X;

    powerY   = posY + POWER_OFFSET_Y;


    radX     = left ? posX + RAD_OFFSET_X  :
                      posX - RAD_OFFSET_X;

    radY     = posY + RAD_OFFSET_Y;

    angleMin = side ? ANGLE_MIN : -ANGLE_MAX;
    angleMax = side ? ANGLE_MAX : -ANGLE_MIN;

    setAngle( DEFAULT_ANGLE );
    setPower( DEFAULT_POWER );

    active   = false
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

      // log(step + ' || ' + angleMax);

      rad = radians( step );
    }

    void decreaseAngle() {

      int step = 1;

      step = degrees(rad) - step;

      if ( step < angleMin ) return;

      rad = radians( step );
    }


  // ------------------------------------ //

    // used for reset
    void setPower ( float charge ) {

      charging = false;

      power = charge;
    }


    void increasePower ( int step ){

      if ( !step ) step = 2;

      if ( !charging ) {

        charging = true;

        CHARGE_COUNTER = 0;
      }

      power += step;
    }


  // ------------------------------------ //

    // defined by power
    float getVelocity(){

      return pow( 2 * DENSITY_WATER * CANNON_WIDTH * power, 1/3 );
    }

    // force of a "bullet"
    float getForce(){

      return DENSITY_WATER * CANNON_WIDTH * pow( getVelocity(), 2 );
    }

    // provide the velocity for the opposite direction
    float getCannonVel(){

      return getVelocity() * cos( rad );
    }


  // ------------------------------------ //

  void update ( float delta ) {

    if ( charging ) CHARGE_COUNTER += delta;

    if ( !active ) return;


    duration += delta;


    float x0, v0;

    // differ betweeen continuation & slowing down
    if ( duration <= CHARGE_COUNTER ) {

      x0 = posX;
      v0 = getCannonVel();

    } else {

      // x0 = getX(CHARGE_COUNTER);
      // v0 = getV(CHARGE_COUNTER);
    }

    distance = getPosX( x0, v0, duration ) - posX;

    // sprinkle
    // if ( distance != 0 ) game.players[ id ].water.add();
  }


    int getPosX ( float x0, float vx0, float t ) {

      return x0 + vx0 * t + ( getForce() / WEIGHT_CANNON - FRICTION_SLIDING * GRAVITY ) * (t*t) / 2;
    }


    int getX ( float t ) {


    }


    int getV ( float t ) {

      float vx0;

      return vx0 >= 0 ? vx0 : 0;
    }



  // ------------------------------------ //

  void draw(){

    fill( PLAYER_COLORS[ left ? 0 : 1 ] );

    if ( isActive() ) text( floor( abs( degrees(rad) ) + 0.5 ) + ' °', drawX( radX ), drawY( radY ) );

    pushMatrix();

      turn();

      rect( drawX(posX + distance), drawY(posY), getModel(CANNON_WIDTH), getModel(CANNON_HEIGHT) );

      fill( BEARING_COLOR );
      ellipse( drawX(bearingPosX), drawY(bearingPosY), getModel(BEARING_RADIUS), getModel(BEARING_RADIUS) );

    popMatrix();


    // showing the current power
    if ( !charging ) return;

    fill( POWER_COLOR );

    text( floor( getVelocity() ) + ' m/s²', drawX( powerX ), drawY( powerY ) );
  }


    // check activity
    boolean isActive(){ return game.currentPlayer.id == id; }


    void turn() {

      translate( drawX(bearingPosX), drawY(bearingPosY) );

      rotate( rad );

      translate( -drawX(bearingPosX), -drawY(bearingPosY) );
    }
}
