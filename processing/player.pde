//
int      BASE_OFFSET    = RANGE;

int[]    PLAYER_POSX    = { - BASE_OFFSET, BASE_OFFSET };

colors[] PLAYER_COLORS  = { #385E92, #92383A };



// Constructor
class Player implements Element {

  int id,               // id of the player
      playerPosX,       // x-offset
      numElements;      // amount of elements

  Elements[] elements;  // elements of the player

  // internal references
  Cart cart; Silo silo; Cannon cannon; Wall wall; Water water;

  // ------------------------------------ //

  Player ( int playerID ) {

    id          = playerID;
    playerPosX  = PLAYER_POSX[ id ];

    this.init();
  }

  // ------------------------------------ //


  void init(){

    // e.g. 0 -> false -> ! -> true, first player -> left
    cart       = new Cart    ( !id, playerPosX );
    silo       = new Silo    ( !id, playerPosX );
    cannon     = new Cannon  ( !id, playerPosX, id );
    wall       = new Wall    ( !id, playerPosX );

    water      = new Water   ( cannon );

    elements = { water, wall, cannon, silo, cart };
  }


  // ------------------------------------ //

  void charge(){

    // keep power in range
    if ( cannon.power >= MAX_POWER ) return;

    int step = INCREMENT_POWER;

    cannon.increasePower( step );
    silo.reduceHeight( step );
  }


  void shoot(){

    FRAME_COUNTER   = 0;

    cannon.charging = false;
    cannon.duration = 0;

    water.init();

    game.switchPlayers();

    // getMaxPower();
  }

  // ------------------------------------ //

  void update ( float delta ) {

    numElements = elements.length;
    while ( numElements-- ) elements[ numElements ].update( delta );
  }

  // ------------------------------------ //

  void draw(){

    fill( PLAYER_COLORS[ id ] );

    numElements = elements.length;
    while ( numElements-- ) elements[ numElements ].draw();
  }

  // ------------------------------------ //

  // maxPower != max v0 -> would be 93...

  void getMaxPower(){

    // Player current = game.players[ 0 ],
    //        next    = game.players[ 1 ];

    // int dx  = current.cannon.posX + BULLET_RADIUS - current.cannon.bearingPosX,
    //     dy  = current.cannon.posY                 - current.cannon.bearingPosY;
    //     deg = 45.0;


    // float bulletPosX = cos( deg ) * dx + sin( deg ) * dy + current.cannon.bearingPosX,  // ~ -6

    //       wallPosX = next.wall.posX;                                                    // 4

    //       distance = wallPosX - bulletPosX - BULLET_RADIUS - 1;                 // ~ 9.5

    //       maxPower = distance * GRAVITY / sin( 2 * deg );                               // ~ 104

    // log(maxPower);
  }

}

