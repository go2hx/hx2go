package go.image;

/**
    A Rectangle contains the points with Min.X <= X < Max.X, Min.Y <= Y < Max.Y.
    It is well-formed if Min.X <= Max.X and likewise for Y. Points are always
    well-formed. A rectangle's methods always return well-formed outputs for
    well-formed inputs.
    
    A Rectangle is also an [Image] whose bounds are the rectangle itself. At
    returns color.Opaque for points in the rectangle and color.Transparent
    otherwise.
**/
@:structInit
@:go.Type({ name: "Rectangle", instanceName: "image.Rectangle", imports: ["image"] })
extern class Rectangle {

    @:native("Min") var min: go.image.Point;
    @:native("Max") var max: go.image.Point;

    function new(min: go.image.Point, max: go.image.Point);

    /**
        Add returns the rectangle r translated by p.
    **/
    @:native("Add") function add(p: go.image.Point): (go.image.Rectangle);
    /**
        At implements the [Image] interface.
    **/
    @:native("At") function at(x: go.GoInt, y: go.GoInt): (go.image.color.Color);
    /**
        Bounds implements the [Image] interface.
    **/
    @:native("Bounds") function bounds(): (go.image.Rectangle);
    /**
        Canon returns the canonical version of r. The returned rectangle has minimum
        and maximum coordinates swapped if necessary so that it is well-formed.
    **/
    @:native("Canon") function canon(): (go.image.Rectangle);
    /**
        ColorModel implements the [Image] interface.
    **/
    @:native("ColorModel") function colorModel(): (go.image.color.Model);
    /**
        Dx returns r's width.
    **/
    @:native("Dx") function dx(): (go.GoInt);
    /**
        Dy returns r's height.
    **/
    @:native("Dy") function dy(): (go.GoInt);
    /**
        Empty reports whether the rectangle contains no points.
    **/
    @:native("Empty") function empty(): (Bool);
    /**
        Eq reports whether r and s contain the same set of points. All empty
        rectangles are considered equal.
    **/
    @:native("Eq") function eq(s: go.image.Rectangle): (Bool);
    /**
        In reports whether every point in r is in s.
    **/
    @:native("In") function _in(s: go.image.Rectangle): (Bool);
    /**
        Inset returns the rectangle r inset by n, which may be negative. If either
        of r's dimensions is less than 2*n then an empty rectangle near the center
        of r will be returned.
    **/
    @:native("Inset") function inset(n: go.GoInt): (go.image.Rectangle);
    /**
        Intersect returns the largest rectangle contained by both r and s. If the
        two rectangles do not overlap then the zero rectangle will be returned.
    **/
    @:native("Intersect") function intersect(s: go.image.Rectangle): (go.image.Rectangle);
    /**
        Overlaps reports whether r and s have a non-empty intersection.
    **/
    @:native("Overlaps") function overlaps(s: go.image.Rectangle): (Bool);
    /**
        RGBA64At implements the [RGBA64Image] interface.
    **/
    @:native("RGBA64At") function rGBA64At(x: go.GoInt, y: go.GoInt): (go.image.color.RGBA64);
    /**
        Size returns r's width and height.
    **/
    @:native("Size") function size(): (go.image.Point);
    /**
        String returns a string representation of r like "(3,4)-(6,5)".
    **/
    @:native("String") function string(): (String);
    /**
        Sub returns the rectangle r translated by -p.
    **/
    @:native("Sub") function sub(p: go.image.Point): (go.image.Rectangle);
    /**
        Union returns the smallest rectangle that contains both r and s.
    **/
    @:native("Union") function union(s: go.image.Rectangle): (go.image.Rectangle);

}