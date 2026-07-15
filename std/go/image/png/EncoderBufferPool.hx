package go.image.png;

@:go.Type({ name: "EncoderBufferPool", instanceName: "png.EncoderBufferPool", imports: ["image/png"] })
extern typedef EncoderBufferPool = {

    @:native("Get") function get(): go.Pointer<go.image.png.EncoderBuffer>;
    @:native("Put") function put(p0: go.Pointer<go.image.png.EncoderBuffer>): Void;

}