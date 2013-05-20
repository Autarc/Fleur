// Configuration
float CLOUD_RADIUS  = 2,                                // 2m

      CLOUD_CENTERX = 0,
      CLOUD_CENTERY = WORLD_HEIGHT - CLOUD_RADIUS * 2;//2.5;


color CLOUD_COLOR   = #698AEC,
      VOLUME_COLOR  = #000000;


// Constructor
class Cloud implements Element {

  float posX, posY, radius,
        step;

  int volume,
      lastLength, value;

  // ------------------------------------ //

  Cloud(){

    init();
  }

    void init(){

      volume   = 0;
      step     = 0;

      posX     = CLOUD_CENTERX;
      posY     = CLOUD_CENTERY;
      radius   = CLOUD_RADIUS;
    }

  // ------------------------------------ //

  void update ( float delta ) {}


  void volumeIncrease ( endLength ) {

    if ( lastLength != endLength ) volumeSetup( endLength );

    step += value / lastLength;

    if ( volume >= 100 ) return;

    if ( step < 1 ) return;

    step = 0;

    volume++;
  }


    void volumeSetup ( int endLength ) {

      lastLength = endLength;

      value = DIFFICULTY_FILL_BASE - endLength / DIFFICULTY_FILL_LOSS;

      step = 0;
    }


    // void volumeDecrease(){

    //   int step = 1;

    //   if ( volume <= 0 ) return;

    //   volume -= step;
    // }

  // ------------------------------------ //

  void draw(){

    fill( CLOUD_COLOR );

    ellipse( drawX(posX), drawY(posY), getModel(radius), getModel(radius) );

    fill( VOLUME_COLOR );

    // text rendering
    text( volume + "%", drawX(posX) - 10, drawY(posY) + 5 );


    image( IMAGE_CLOUD, drawX(posX-1.75), drawY(posY+1) );
  }
}
