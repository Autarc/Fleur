// Configuration
int FIELD_SIZE = SCREEN_WIDTH - 2 * ( WALL_POSX + WALL_WIDTH );


// Constructor
class Field implements Element {

  Plants[]  plants;
  int       numPlants;


  // ------------------------------------ //

  Field(){

    plants = new Plants[0];
  }


    void init ( int num ) {

      int PLANT_WIDTH = floor( FIELD_SIZE / num / 2 ); // -> regard offset

      plants    = new Plants[ num ];

      while ( num-- ) plants[num] = new Plant( PLANT_WIDTH, num );
    }


  // ------------------------------------ //


  void update ( delta ) {

    numPlants = plants.length;
    while ( numPlants-- ) plants[ numPlants ].update( delta );
  }


  // ------------------------------------ //


  void draw(){

    numPlants = plants.length;
    while ( numPlants-- ) plants[ numPlants ].draw();
  }

}
