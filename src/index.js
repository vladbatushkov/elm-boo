'use strict';

var Elm = require('./Main.elm');

var node = document.getElementById('main');
var app = Elm.Main.embed(node, {
    title: 'Elm-boo',
    globalWidth: window.screen.width,
    globalHeight: window.screen.height
});