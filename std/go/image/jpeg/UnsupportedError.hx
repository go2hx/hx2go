package go.image.jpeg;

/**
    An UnsupportedError reports that the input uses a valid but unimplemented JPEG feature.
**/
@:go.Type({ name: "UnsupportedError", instanceName: "jpeg.UnsupportedError", imports: ["image/jpeg"] })
extern typedef UnsupportedError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>