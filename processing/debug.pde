// Configuration

boolean debug = false;

// debug setup
if ( debug ) println("[Debug]\n\n");


void log ( String text ) {

  if ( !debug ) return;

  println(text);
}


// showing a  label - which updates the mouse move coordinates

void mouseMoved(){

  if ( !debug ) return;

  // log( "mouse( " + mouseX + " | " + mouseY + " ) : re-draw( " + drawX(mouseX) + " | " + drawY(mouseY) + " )");
  // log( "mouse( " + drawX( coordX(mouseX)) + " | " + drawY( coordY(mouseY) ) + " ) - cartesian( " + coordX(mouseX) + " | " + coordY(mouseY) + " )");
}


void debugDraw(){

  // fill('0x000000');

  // showGrid();
}




int strokeSize  = 2,
    stepOffset  = 50;

void showGrid(){

  for ( int x = 0, xn = SCREEN_WIDTH/stepOffset/2; x < xn; x++ ) {

    rect( drawX(  x * stepOffset - strokeSize/2), drawY(0), strokeSize, drawY(300) );
    rect( drawX( -x * stepOffset - strokeSize/2), drawY(0), strokeSize, drawY(300) );
  }

  for ( int y = 1, yn = GROUND_POSY/stepOffset; y < yn; y++ ) { // -GROUND_POSY ?
    rect( drawX(-SCREEN_WIDTH/2), drawY( -GROUND_POSY + stepOffset * y ), SCREEN_WIDTH, strokeSize );
  }

}
