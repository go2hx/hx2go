package go.image;

/**
    Package draw provides image composition functions.
    
    See "The Go image/draw package" for an introduction to this package:
    https://golang.org/doc/articles/image_draw.html
**/
@:go.Type({ name: "draw", instanceName: "draw.draw", imports: ["image/draw"] })
extern class Draw {

    @:native("Over") static var over: go.image.draw.Op;
    @:native("Src") static var src: go.image.draw.Op;

    /**
        FloydSteinberg is a [Drawer] that is the [Src] [Op] with Floyd-Steinberg error
        diffusion.
    **/
    @:native("FloydSteinberg") static var floydSteinberg: go.image.draw.Drawer;

    /**
        Draw calls [DrawMask] with a nil mask.
    **/
    @:native("Draw") static function draw(dst: go.image.draw.Image, r: go.image.Rectangle, src: go.image.Image, sp: go.image.Point, op: go.image.draw.Op): Void;
    /**
        DrawMask aligns r.Min in dst with sp in src and mp in mask and then replaces the rectangle r
        in dst with the result of a Porter-Duff composition. A nil mask is treated as opaque.
    **/
    @:native("DrawMask") static function drawMask(dst: go.image.draw.Image, r: go.image.Rectangle, src: go.image.Image, sp: go.image.Point, mask: go.image.Image, mp: go.image.Point, op: go.image.draw.Op): Void;

}