package go.image.color;

@:go.Type({ name: "palette", instanceName: "palette.palette", imports: ["image/color/palette"] })
extern class Palette_ {

    @:native("Plan9") static var plan9: go.Slice<go.image.color.Color>;
    @:native("WebSafe") static var webSafe: go.Slice<go.image.color.Color>;

}