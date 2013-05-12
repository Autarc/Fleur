var tracks = {

    ground  : '166823__quistard__water-drop-big.wav',
    wall    : '81258__jesterdyne__splash2-hi.wav',
    cloud   : '166158__adam-n__slurp.wav',
    bullet  : '95087__nicstage__pewitswater2.wav'

  },

  loop = 'bullet'

        .split(' ');

//----------------------------------------------------------//

if ( !window.URL ) window.URL = window.webkitURL || window.msURL || window.oURL;

//----------------------------------------------------------//

var entries = Object.keys( tracks ),

    length  = entries.length,

    pending = length,

    callback;

for ( var i = 0; i < length; i++ ) request( entries[i] );


function request ( key ) {

  var xhr = new XMLHttpRequest();

  xhr.open( 'GET', 'assets/sounds/' + tracks[ key ] );

  xhr.onload = function ( e ) { loaded( key, e.currentTarget.response ); };

  xhr.responseType = 'blob';

  xhr.send();
}


function loaded ( key, data ) {

  var url   = URL.createObjectURL( data ),

      track = new Audio( url );

  if ( ~loop.indexOf(key) ) track.loop = true;

  tracks[ key ] = track;

  if ( ! --pending && typeof callback === 'function' ) callback();
}


function ready ( init ) {

  callback = init;

  if ( !pending ) callback();
}
