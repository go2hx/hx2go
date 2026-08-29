package go.image;

/**
    YCbCrSubsampleRatio is the chroma subsample ratio used in a YCbCr image.
**/
@:go.Type({ name: "YCbCrSubsampleRatio", instanceName: "image.YCbCrSubsampleRatio", imports: ["image"] })
extern typedef YCbCrSubsampleRatio = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>