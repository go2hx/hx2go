package go.image;

@:go.Type({ name: "draw", instanceName: "draw.draw", imports: ["image/draw"] })
extern class Draw {

    @:native("Over") static var Over: go.image.draw.Op;
    @:native("Src") static var Src: go.image.draw.Op;

    @:native("FloydSteinberg") static var FloydSteinberg: go.image.draw.Drawer;

    @:native("Draw") static function draw(dst: go.image.draw.Image, r: go.image.Rectangle, src: go.image.Image, sp: go.image.Point, op: go.image.draw.Op): Void;
    @:native("DrawMask") static function drawMask(dst: go.image.draw.Image, r: go.image.Rectangle, src: go.image.Image, sp: go.image.Point, mask: go.image.Image, mp: go.image.Point, op: go.image.draw.Op): Void;

}