package go.image.png;

/**
    A FormatError reports that the input is not a valid PNG.
**/
@:go.Type({ name: "FormatError", instanceName: "png.FormatError", imports: ["image/png"] })
extern typedef FormatError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>