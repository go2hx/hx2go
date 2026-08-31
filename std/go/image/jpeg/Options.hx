package go.image.jpeg;

/**
    Options are the encoding parameters.
    Quality ranges from 1 to 100 inclusive, higher is better.
**/
@:structInit
@:go.Type({ name: "Options", instanceName: "jpeg.Options", imports: ["image/jpeg"] })
extern class Options {

    @:native("Quality") var quality: go.GoInt;

    function new(quality: go.GoInt=0);

}