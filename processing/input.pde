// Helper Class

class ClickZone {

  String id;

  int x, y, x2, y2;

  Function fn;

  // ------------------------------------ //

  ClickZone( String which, int[] coords, Function callback ) {

    x       = coords[0];
    y       = coords[1];
    x2      = x + coords[2];
    y2      = y + coords[3];

    id      = which;
    fn      = callback;
  }

}


// ------------------------------------ //

ArrayList clickCommands = new ArrayList();

void onClick( String which, int[] coords, Function callback ) {

  clickCommands.add( new ClickZone( which, coords, callback ) );
}


// ------------------------------------ //

void mouseClicked(){

  int       posX        = mouseX,
            posY        = mouseY,
            numCommands = clickCommands.size();

  ClickZone currentZone;

  while ( numCommands-- ) {

    currentZone = clickCommands.get( numCommands );

    if (  !( posX < currentZone.x  ||
             posX > currentZone.x2 ||
             posY < currentZone.y  ||
             posY > currentZone.y2    ) ) {

      // log( currentZone.id );
      currentZone.fn();
      return;
    }
  }

}


// ------------------------------------ //

HashMap keyCommands = new HashMap();

void onKey( String which, Function callback ) {

  keyCommands.put( which, callback );
}


// ------------------------------------ //

String    currentKey;
Function  currentAction;

void keyPressed(){

  currentKey = ( key != CODED && checkASCII( keyCode ) ) ? key : checkKey();

  currentAction = keyCommands.get( currentKey );

  if ( currentAction ) currentAction();
}


int[] defaultASCII = {

  8,        // BACKSPACE
  9,        // TAB
  10, 13,   // ENTER
  16,       // SHIFT
  27,       // ESC
  32,       // SPACE
  46        // DEL
};

int keyLength = defaultASCII.length;

boolean checkASCII ( String inputKey ) {

  for ( int i = 0; i < keyLength; i++ ) {

    if ( inputKey == defaultASCII[i] ) return false;
  }

  return true;
}


String checkKey(){

  if ( keyCode == LEFT )                        return 'LEFT';
  if ( keyCode == RIGHT )                       return 'RIGHT';
  if ( keyCode == UP )                          return 'UP';
  if ( keyCode == DOWN )                        return 'DOWN';
  if ( keyCode == 32 )                          return 'SPACE';
  if ( keyCode == ALT )                         return 'ALT';
  if ( keyCode == CONTROL )                     return 'CTRL';
  if ( keyCode == SHIFT )                       return 'SHIFT';
  if ( keyCode == BACKSPACE )                   return 'BACKSPACE';
  if ( keyCode == TAB )                         return 'TAB';
  if ( keyCode == ENTER || keyCode == RETURN )  return 'ENTER';
  if ( keyCode == ESC )                         return 'ESC';
  if ( keyCode == DELETE )                      return 'DELETE';
}
