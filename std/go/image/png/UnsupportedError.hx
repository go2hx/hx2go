package go.image.png;

/**
    An UnsupportedError reports that the input uses a valid but unimplemented PNG feature.
**/
@:go.Type({ name: "UnsupportedError", instanceName: "png.UnsupportedError", imports: ["image/png"] })
extern typedef UnsupportedError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>