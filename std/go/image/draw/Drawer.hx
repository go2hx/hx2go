package go.image.draw;

@:go.Type({ name: "Drawer", instanceName: "draw.Drawer", imports: ["image/draw"] })
extern typedef Drawer = {

    @:native("Draw") function draw(dst: go.image.draw.Image, r: go.image.Rectangle, src: go.image.Image, sp: go.image.Point): Void;

}