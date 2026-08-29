package go.image;

/**
    A Point is an X, Y coordinate pair. The axes increase right and down.
**/
@:structInit
@:go.Type({ name: "Point", instanceName: "image.Point", imports: ["image"] })
extern class Point {

    @:native("X") var X: go.GoInt;
    @:native("Y") var Y: go.GoInt;

    function new(X: go.GoInt=0, Y: go.GoInt=0);

    /**
        Add returns the vector p+q.
    **/
    @:native("Add") function add(q: go.image.Point): (go.image.Point);
    /**
        Div returns the vector p/k.
    **/
    @:native("Div") function div(k: go.GoInt): (go.image.Point);
    /**
        Eq reports whether p and q are equal.
    **/
    @:native("Eq") function eq(q: go.image.Point): (Bool);
    /**
        In reports whether p is in r.
    **/
    @:native("In") function _in(r: go.image.Rectangle): (Bool);
    /**
        Mod returns the point q in r such that p.X-q.X is a multiple of r's width
        and p.Y-q.Y is a multiple of r's height.
    **/
    @:native("Mod") function mod(r: go.image.Rectangle): (go.image.Point);
    /**
        Mul returns the vector p*k.
    **/
    @:native("Mul") function mul(k: go.GoInt): (go.image.Point);
    /**
        String returns a string representation of p like "(3,4)".
    **/
    @:native("String") function string(): (String);
    /**
        Sub returns the vector p-q.
    **/
    @:native("Sub") function sub(q: go.image.Point): (go.image.Point);

}