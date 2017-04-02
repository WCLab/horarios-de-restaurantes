function template(locals) {
var jade_debug = [ new jade.DebugItem( 1, "assets/templates/restaurantes/edit.jade" ) ];
try {
var buf = [];
var jade_mixins = {};
var jade_interp;

jade_debug.unshift(new jade.DebugItem( 0, "assets/templates/restaurantes/edit.jade" ));
jade_debug.unshift(new jade.DebugItem( 1, "assets/templates/restaurantes/edit.jade" ));
buf.push("<div ng-controller=\"RestaurantesController\">");
jade_debug.unshift(new jade.DebugItem( undefined, jade_debug[0].filename ));
jade_debug.unshift(new jade.DebugItem( 2, "assets/templates/restaurantes/edit.jade" ));
buf.push("<div>");
jade_debug.unshift(new jade.DebugItem( undefined, jade_debug[0].filename ));
jade_debug.unshift(new jade.DebugItem( 2, jade_debug[0].filename ));
buf.push("{{restaurante.nombre}}");
jade_debug.shift();
jade_debug.shift();
buf.push("</div>");
jade_debug.shift();
jade_debug.shift();
buf.push("</div>");
jade_debug.shift();
jade_debug.shift();;return buf.join("");
} catch (err) {
  jade.rethrow(err, jade_debug[0].filename, jade_debug[0].lineno, "div(ng-controller=\"RestaurantesController\")\n\tdiv {{restaurante.nombre}}\n\t");
}
}