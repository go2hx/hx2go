package go.image;

@:structInit
@:go.Type({ name: "Rectangle", instanceName: "image.Rectangle", imports: ["image"] })
extern class Rectangle {

    @:native("Min") var min: go.image.Point;
    @:native("Max") var max: go.image.Point;

function new(min: go.image.Point, max: go.image.Point);

    @:native("Add") function add(p: go.image.Point): go.image.Rectangle;
    @:native("At") function at(x: go.GoInt, y: go.GoInt): go.image.color.Color;
    @:native("Bounds") function bounds(): go.image.Rectangle;
    @:native("Canon") function canon(): go.image.Rectangle;
    @:native("ColorModel") function colorModel(): go.image.color.Model;
    @:native("Dx") function dx(): go.GoInt;
    @:native("Dy") function dy(): go.GoInt;
    @:native("Empty") function empty(): Bool;
    @:native("Eq") function eq(s: go.image.Rectangle): Bool;
    @:native("In") function _in(s: go.image.Rectangle): Bool;
    @:native("Inset") function inset(n: go.GoInt): go.image.Rectangle;
    @:native("Intersect") function intersect(s: go.image.Rectangle): go.image.Rectangle;
    @:native("Overlaps") function overlaps(s: go.image.Rectangle): Bool;
    @:native("RGBA64At") function rGBA64At(x: go.GoInt, y: go.GoInt): go.image.color.RGBA64;
    @:native("Size") function size(): go.image.Point;
    @:native("String") function string(): String;
    @:native("Sub") function sub(p: go.image.Point): go.image.Rectangle;
    @:native("Union") function union(s: go.image.Rectangle): go.image.Rectangle;

}