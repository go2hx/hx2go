package go.image.draw;

@:structInit
@:go.Type({ name: "floydSteinberg", instanceName: "draw.floydSteinberg", imports: ["image/draw"] })
extern class FloydSteinberg {

    @:native("Draw") function draw(dst: go.image.draw.Image, r: go.image.Rectangle, src: go.image.Image, sp: go.image.Point): Void;

}