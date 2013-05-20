// Configuration
float CART_OFFSET     = 1  ,
      CART_WIDTH      = 3  ,
      CART_HEIGHT     = 0.5,

      WHEEL_RADIUS    = 1,
      WHEEL_OFFSET    = CART_WIDTH/4,
      SEAT_RADIUS     = CART_WIDTH,

      CART_POSY       = WHEEL_RADIUS,// + CART_HEIGHT,
      WHEEL_POSY      = WHEEL_RADIUS/2,
      SEAT_POSY       = CART_POSY;

color CART_COLOR      = #1E1F19,
      WHEEL_COLOR     = #111410,
      SEAT_COLOR      = #35383A;


class Cart implements Element {

  int posX, resetX,

      frontWheelPosX, resetFrontWheelX,

      backWheelPosX, resetBackWheelX,

      seatPosX, resetSeatPosX,

      distance;

  boolean left;

  // ------------------------------------ //

  Cart ( boolean side, int playerPosX ) {

    left = side;

    resetX = side ? playerPosX + CART_OFFSET                :
                    playerPosX - CART_OFFSET - CART_WIDTH;

    resetFrontWheelX = resetX + WHEEL_OFFSET;
    resetBackWheelX  = resetX + CART_WIDTH - WHEEL_OFFSET;

    resetSeatPosX    = resetX + CART_WIDTH/2;


    init();
  }

    // reset of the cart...
    void init(){

      distance        = 0;

      posX            = resetX;
      frontWheelPosX  = resetFrontWheelX;
      backWheelPosX   = resetBackWheelX;
      seatPosX        = resetSeatPosX;
    }


  // ------------------------------------ //

  void update ( float delta ) {}

  // ------------------------------------ //


  void draw(){

    fill( CART_COLOR );
    rect( drawX(posX), drawY(CART_POSY), getModel(CART_WIDTH), getModel(CART_HEIGHT) );

    fill( WHEEL_COLOR );
    ellipse( drawX(frontWheelPosX), drawY(WHEEL_POSY), getModel(WHEEL_RADIUS), getModel(WHEEL_RADIUS) );
    ellipse( drawX(backWheelPosX), drawY(WHEEL_POSY), getModel(WHEEL_RADIUS), getModel(WHEEL_RADIUS) );

    noFill();
    stroke( SILO_COLOR );
    arc( drawX(seatPosX), drawY(SEAT_POSY), getModel(SEAT_RADIUS), getModel(SEAT_RADIUS), -PI, 0  );
    noStroke();
  }

}
