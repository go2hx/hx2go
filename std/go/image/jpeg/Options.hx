package go.image.jpeg;

@:structInit
@:go.Type({ name: "Options", instanceName: "jpeg.Options", imports: ["image/jpeg"] })
extern class Options {

    @:native("Quality") var quality: go.GoInt;

function new(quality: go.GoInt);

}