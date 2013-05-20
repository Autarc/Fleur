var tracks = {

    ground  : 'surface.ogg',      //'166823__quistard__water-drop-big.wav',
    wall    : 'reflection.ogg',   //'81258__jesterdyne__splash2-hi.wav',
    cloud   : 'vortex.ogg',       //'166158__adam-n__slurp.wav',
    bullet  : 'water.ogg'         //'95087__nicstage__pewitswater2.wav'

  },

  loop = 'bullet'

        .split(' ');

//----------------------------------------------------------//

if ( !window.URL ) window.URL = window.webkitURL || window.msURL || window.oURL;

//----------------------------------------------------------//

var entries   = Object.keys( tracks ),

    pending   = entries.length,

    percent   = 0,

    step      = 1/pending * 100,

    callbackProgress, callbackReady;

for ( var i = 0, l = pending; i < l; i++ ) request( entries[i] );


function request ( key ) {

  var xhr = new XMLHttpRequest();

  xhr.open( 'GET', 'assets/sounds/' + tracks[ key ] );

  xhr.onload = function ( e ) { loaded( key, e.currentTarget.response ); };

  xhr.responseType = 'blob';

  xhr.send();
}


function loaded ( key, data ) {

  var url = URL.createObjectURL( data );

  // make sure data URL exists
  setTimeout(function(){

    new Audio( url ).addEventListener( 'canplay' , function storeTrack(){

      this.removeEventListener( 'canplay', storeTrack );

      URL.revokeObjectURL( url );

      if ( ~loop.indexOf(key) ) this.loop = true;

      tracks[ key ] = this;

      callbackProgress( percent += step );

      if ( ! --pending && typeof callbackReady === 'function' ) callbackReady();
    });

  }, 16.7 );
}


function loading ( progress ) {

  callbackProgress = progress;
}


function ready ( init ) {

  callbackReady = init;

  if ( !pending ) callbackReady();
}
