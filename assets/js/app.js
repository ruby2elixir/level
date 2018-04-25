// We need to import the CSS so that webpack will load it.
// The ExtractTextPlugin is used to separate it out into
// its own CSS file.
import css from '../css/app.css';

// webpack automatically concatenates all files in your
// watched paths. Those paths can be configured as
// endpoints in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html";

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

import * as Space from "./modules/space";
import * as NewSpace from "./modules/new_space";

const moduleNode = document.head.querySelector("meta[name='module']");

if (moduleNode) {
  switch (moduleNode.content) {
    case "space":
      Space.initialize();
      break;

    case "new_space":
      NewSpace.initialize();
      break;

    default:
      break;
  }
}
