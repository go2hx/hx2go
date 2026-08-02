package go.image.png;

@:go.Type({ name: "UnsupportedError", instanceName: "png.UnsupportedError", imports: ["image/png"] })
extern typedef UnsupportedError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>