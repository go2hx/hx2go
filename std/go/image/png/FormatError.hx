package go.image.png;

@:go.Type({ name: "FormatError", instanceName: "png.FormatError", imports: ["image/png"] })
extern typedef FormatError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>