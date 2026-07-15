package go.image.gif;

@:structInit
@:go.Type({ name: "Options", instanceName: "gif.Options", imports: ["image/gif"] })
extern class Options {

    @:native("NumColors") var numColors: go.GoInt;
    @:native("Quantizer") var quantizer: go.image.draw.Quantizer;
    @:native("Drawer") var drawer: go.image.draw.Drawer;

function new(numColors: go.GoInt, quantizer: go.image.draw.Quantizer, drawer: go.image.draw.Drawer);

}