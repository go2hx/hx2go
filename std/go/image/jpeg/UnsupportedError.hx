package go.image.jpeg;

@:go.Type({ name: "UnsupportedError", instanceName: "jpeg.UnsupportedError", imports: ["image/jpeg"] })
extern typedef UnsupportedError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>