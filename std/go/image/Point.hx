package go.image;

@:structInit
@:go.Type({ name: "Point", instanceName: "image.Point", imports: ["image"] })
extern class Point {

    @:native("X") var X: go.GoInt;
    @:native("Y") var Y: go.GoInt;

function new(X: go.GoInt, Y: go.GoInt);

    @:native("Add") function add(q: go.image.Point): go.image.Point;
    @:native("Div") function div(k: go.GoInt): go.image.Point;
    @:native("Eq") function eq(q: go.image.Point): Bool;
    @:native("In") function _in(r: go.image.Rectangle): Bool;
    @:native("Mod") function mod(r: go.image.Rectangle): go.image.Point;
    @:native("Mul") function mul(k: go.GoInt): go.image.Point;
    @:native("String") function string(): String;
    @:native("Sub") function sub(q: go.image.Point): go.image.Point;

}