package go.image.jpeg;

/**
    A FormatError reports that the input is not a valid JPEG.
**/
@:go.Type({ name: "FormatError", instanceName: "jpeg.FormatError", imports: ["image/jpeg"] })
extern typedef FormatError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);

}>