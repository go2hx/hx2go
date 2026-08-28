package go.image;

/**
    Alpha is an in-memory image whose At method returns [color.Alpha] values.
**/
@:structInit
@:go.Type({ name: "Alpha", instanceName: "image.Alpha", imports: ["image"] })
extern class Alpha {

    @:native("Pix") var pix: go.Slice<go.UInt8>;
    @:native("Stride") var stride: go.GoInt;
    @:native("Rect") var rect: go.image.Rectangle;

    function new(pix: go.Slice<go.UInt8>=null, stride: go.GoInt=0, rect: go.image.Rectangle);

    @:native("AlphaAt") function alphaAt(x: go.GoInt, y: go.GoInt): (go.image.color.Alpha);
    @:native("At") function at(x: go.GoInt, y: go.GoInt): (go.image.color.Color);
    @:native("Bounds") function bounds(): (go.image.Rectangle);
    @:native("ColorModel") function colorModel(): (go.image.color.Model);
    /**
        Opaque scans the entire image and reports whether it is fully opaque.
    **/
    @:native("Opaque") function opaque(): (Bool);
    /**
        PixOffset returns the index of the first element of Pix that corresponds to
        the pixel at (x, y).
    **/
    @:native("PixOffset") function pixOffset(x: go.GoInt, y: go.GoInt): (go.GoInt);
    @:native("RGBA64At") function rGBA64At(x: go.GoInt, y: go.GoInt): (go.image.color.RGBA64);
    @:native("Set") function set(x: go.GoInt, y: go.GoInt, c: go.image.color.Color): Void;
    @:native("SetAlpha") function setAlpha(x: go.GoInt, y: go.GoInt, c: go.image.color.Alpha): Void;
    @:native("SetRGBA64") function setRGBA64(x: go.GoInt, y: go.GoInt, c: go.image.color.RGBA64): Void;
    /**
        SubImage returns an image representing the portion of the image p visible
        through r. The returned value shares pixels with the original image.
    **/
    @:native("SubImage") function subImage(r: go.image.Rectangle): (go.image.Image);

}