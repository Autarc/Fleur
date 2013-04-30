// Configuration
int FIELD_SIZE = ( WORLD_WIDTH - 1 ) - 2 * ( WALL_POSX + WALL_WIDTH );


// Constructor
class Field implements Element {

  Plants[]  plants;
  int       numPlants;

  // ------------------------------------ //

  Field(){

    // temp placeholder
    plants = new Plants[0];
  }


    void init ( int num ) {

      int PLANT_WIDTH = floor( FIELD_SIZE / num / 2 + 0.5 ); // -> regard offset

      float space     = ( FIELD_SIZE - num * PLANT_WIDTH ) / num,

            offset    = space/2;

            plants    = new Plants[ num ];

      while ( num-- ) plants[num] = new Plant( PLANT_WIDTH, offset, num );
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
