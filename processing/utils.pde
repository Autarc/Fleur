/**
 *  Calculating the ModelTime - defined for the real by the frame time
 */

float getTime ( float frameTime ) {

  return frameTime / SCALE_T;
}


/**
 *  Translation from cartasian coordinates to processing/drawing.
 */

int drawX ( float movedX ) {

  movedX = getModel( movedX );

  return floor( movedX + SCREEN_WIDTH/2  + 0.5 );
}


// is wrong !

int drawY ( float movedY ) {

  movedY = getModel( movedY );

  return floor( GROUND_POSY - movedY  + 0.5 );
}


/**
 *  Calculation for the Model / Real (be used for width/height - as these will be calculated  but not drawn 1)
 */

float getModel ( float realSize ) {

  return floor( realSize * SCALE_M + 0.5 );  // 2m in real * 40 -> 80px
}
