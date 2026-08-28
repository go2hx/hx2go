package go.image.color;

/**
    Palette is a palette of colors.
**/
@:go.Type({ name: "Palette", instanceName: "color.Palette", imports: ["image/color"] })
extern class Palette {

    /**
        Convert returns the palette color closest to c in Euclidean R,G,B space.
    **/
    @:native("Convert") function convert(c: go.image.color.Color): (go.image.color.Color);
    /**
        Index returns the index of the palette color closest to c in Euclidean
        R,G,B,A space.
    **/
    @:native("Index") function index(c: go.image.color.Color): (go.GoInt);

}