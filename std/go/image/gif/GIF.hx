package go.image.gif;

/**
    GIF represents the possibly multiple images stored in a GIF file.
**/
@:structInit
@:go.Type({ name: "GIF", instanceName: "gif.GIF", imports: ["image/gif"] })
extern class GIF {

    @:native("Image") var image: go.Slice<go.Pointer<go.image.Paletted>>;
    @:native("Delay") var delay: go.Slice<go.GoInt>;
    @:native("LoopCount") var loopCount: go.GoInt;
    @:native("Disposal") var disposal: go.Slice<go.Byte>;
    @:native("Config") var config: go.image.Config;
    @:native("BackgroundIndex") var backgroundIndex: go.Byte;

    function new(image: go.Slice<go.Pointer<go.image.Paletted>>=null, delay: go.Slice<go.GoInt>=null, loopCount: go.GoInt=0, disposal: go.Slice<go.Byte>=null, config: go.image.Config, backgroundIndex: go.Byte=0);

}