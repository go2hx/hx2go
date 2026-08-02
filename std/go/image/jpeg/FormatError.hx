package go.image.jpeg;

@:go.Type({ name: "FormatError", instanceName: "jpeg.FormatError", imports: ["image/jpeg"] })
extern typedef FormatError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>