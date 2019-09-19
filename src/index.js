"use strict";

import "./styles.css";

import { Elm } from "./Main.elm";

var app = Elm.Main.init({
  node: document.getElementById("elm-modal"),
  flags: {
    title: "Elm-boo",
    globalWidth: window.screen.width,
    globalHeight: window.screen.height,
    images: [
      {
        id: "elmlogo",
        src: require("../assets/elm-logo.png")
      }
    ]
  }
});

function init() {
  document.getElementById("buttonPlay").addEventListener("click", function() {
    app.ports.listen.send("");
    console.log("clicked");
  });
}

window.addEventListener("load", init, false);
