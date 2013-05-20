// Constructor
class Water implements Element {

  Bullets[] bullets;
  int       numBullets;


  // internal references
  Cannon cannon;

  // ------------------------------------ //

  Water ( Cannon cann ) {

    cannon  = cann;

    bullets = new ArrayList();
  }

    //
    void init() {

      cannon.active = true;

      add();
    }

    void add(){

      bullets.add( new Bullet( bullets.size(), cannon ) );
    }


  // ------------------------------------ //


  void clearBullets(){

    cannon.active = false;

    numBullets = bullets.size();
    for ( int i = 0; i < numBullets; i++ ) bullets.get(i).clearChanges();
  }


  // ------------------------------------ //


  void update ( delta ) {

    numBullets = bullets.size();
    for ( int i = 0; i < numBullets; i++ ) bullets.get(i).update( delta );
  }


  // ------------------------------------ //


  void draw(){

    numBullets = bullets.size();
    for ( int i = 0; i < numBullets; i++ ) bullets.get(i).draw();
  }

}
