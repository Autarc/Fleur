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

  boolean active;

  // internal references
  Silo silo; Cannon cannon; Wall wall; Bullet bullet;

  // ------------------------------------ //

  Player ( int playerID ) {

    active      = false;

    id          = playerID;
    playerPosX  = PLAYER_POSX[ id ];

    this.init();
  }

  // ------------------------------------ //


  void init(){

    // e.g. 0 -> false -> ! -> true, first player -> left
    silo      = new Silo    ( !id, playerPosX );
    cannon    = new Cannon  ( !id, playerPosX );
    wall      = new Wall    ( !id, playerPosX );
    bullet    = new Bullet  ();

    elements = { bullet, wall, cannon, silo };
  }


    void charge(){

      // keep power in range
      if ( cannon.power >= MAX_POWER ) return;

      int step = 2;

      cannon.increasePower( step );
      silo.reduceHeight( step );
    }


    void shoot(){

      FRAME_COUNTER = 0;

      bullet.init( cannon );

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

  // implementated calculation for v0-max
  void getMaxPower(){

      Player current = game.players[ 0 ],
             next    = game.players[ 1 ];

      int dx  = current.cannon.posX + current.bullet.radius - current.cannon.bearingPosX,
          dy  = current.cannon.posY                         - current.cannon.bearingPosY;
          deg = 45.0;


      float bulletPosX = cos( deg ) * dx + sin( deg ) * dy + current.cannon.bearingPosX,  // ~ -6

            wallPosX = next.wall.posX;                                                    // 4

            distance = wallPosX - bulletPosX - current.bullet.radius - 1;                 // ~ 9.5

            maxPower = distance * GRAVITY / sin( 2 * deg );                               // ~ 104

      log(maxPower);
  }

  void getMinPower(){



  }


}
