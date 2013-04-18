
/**
 *  Calculation for the Model / Real
 */

int getModel ( float realSize ) {

  return floor( realSize * SCALE_M );  // 2m in real * 40 -> 80px
}


int getReal ( float modelSize ) {
  log( floor( modelSize / SCALE_M ) );
  return floor( modelSize / SCALE_M );   // 60 / 40 -> 1.5m as real
}




/**
 *  Translating into cartasian coordinates.
 */

int coordX ( int originX ) {

  return originX - SCREEN_WIDTH/2;
}

int coordY ( int originY ) {

  return GROUND_POSY - originY; // SCREEN_HEIGHT - GROUND_HEIGHT
}


/**
 *  Translation from cartasian coordinates to processing/drawing.
 */

int drawX ( int movedX ) {

  return movedX + SCREEN_WIDTH/2;
}

int drawY ( int movedY ) {

  return ( movedY == 0 ) ? GROUND_POSY : -movedY;
}
