package go.image.draw;

@:go.Type({ name: "Quantizer", instanceName: "draw.Quantizer", imports: ["image/draw"] })
extern typedef Quantizer = {

    @:native("Quantize") function quantize(p: go.image.color.Palette, m: go.image.Image): go.image.color.Palette;

}