package go.image.draw;

/**
    Op is a Porter-Duff compositing operator.
**/
@:go.Type({ name: "Op", instanceName: "draw.Op", imports: ["image/draw"] })
extern typedef Op = haxe.extern.EitherType<go.GoInt, {
    /**
        Draw implements the [Drawer] interface by calling the Draw function with this
        [Op].
    **/
    @:native("Draw") function draw(dst: go.image.draw.Image, r: go.image.Rectangle, src: go.image.Image, sp: go.image.Point): Void;

}>