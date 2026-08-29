package go.image.color;

/**
    Color can convert itself to alpha-premultiplied 16-bits per channel RGBA.
    The conversion may be lossy.
**/
@:go.Type({ name: "Color", instanceName: "color.Color", imports: ["image/color"] })
extern typedef Color = {

    @:go.Tuple("r", "g", "b", "a") @:native("RGBA") function RGBA(): (go.Tuple<{ r: go.UInt32, g: go.UInt32, b: go.UInt32, a: go.UInt32 }>);

}