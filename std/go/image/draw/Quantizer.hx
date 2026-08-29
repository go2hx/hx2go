package go.image.draw;

/**
    Quantizer produces a palette for an image.
**/
@:go.Type({ name: "Quantizer", instanceName: "draw.Quantizer", imports: ["image/draw"] })
extern typedef Quantizer = {

    @:native("Quantize") function quantize(p: go.image.color.Palette, m: go.image.Image): (go.image.color.Palette);

}