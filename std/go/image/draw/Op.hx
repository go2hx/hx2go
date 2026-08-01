package go.image.draw;

@:go.Type({ name: "Op", instanceName: "draw.Op", imports: ["image/draw"] })
extern typedef Op = haxe.extern.EitherType<go.GoInt, {
    @:native("Draw") function draw(dst: go.image.draw.Image, r: go.image.Rectangle, src: go.image.Image, sp: go.image.Point): Void;

}>