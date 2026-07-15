package go.image.color;

@:go.Type({ name: "palette", instanceName: "palette.palette", imports: ["image/color/palette"] })
extern class Palette {

    @:native("Plan9") static var Plan9: go.Slice<go.image.color.Color>;
    @:native("WebSafe") static var WebSafe: go.Slice<go.image.color.Color>;

}