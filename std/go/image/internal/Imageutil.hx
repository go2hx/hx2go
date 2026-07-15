package go.image.internal;

@:go.Type({ name: "imageutil", instanceName: "imageutil.imageutil", imports: ["image/internal/imageutil"] })
extern class Imageutil {

    @:native("DrawYCbCr") static function drawYCbCr(dst: go.Pointer<go.image.RGBA>, r: go.image.Rectangle, src: go.Pointer<go.image.YCbCr>, sp: go.image.Point): Bool;

}