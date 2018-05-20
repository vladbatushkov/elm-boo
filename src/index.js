'use strict';

require('./styles.css');

var Elm = require('./Main.elm');

var node = document.getElementById('elm-modal');
var app = Elm.Main.embed(node, {
    title: 'Elm-boo',
    globalWidth: window.screen.width,
    globalHeight: window.screen.height,
    images: [{
        id: 'elmlogo',
        src: require('../assets/elm-logo.png')
    }]
});

function init() {
    document.getElementById('buttonPlay').addEventListener('click', function () {
        app.ports.listen.send('');
        console.log('clicked');
    });
}

window.addEventListener('load', init, false);