package go.image.png;

@:go.Type({ name: "opaquer", instanceName: "png.opaquer", imports: ["image/png"] })
extern typedef Opaquer = {

    @:native("Opaque") function opaque(): (Bool);

}