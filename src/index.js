'use strict';

require('./styles.css');

var Elm = require('./Main.elm');

var node = document.getElementById('main');
var app = Elm.Main.embed(node, {
    title: 'Elm-boo',
    globalWidth: window.screen.width,
    globalHeight: window.screen.height,
    images: [{
        id: 'elmlogo',
        src: require('../assets/elm-logo.png')
    }]
});