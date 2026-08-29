package go.image.png;

/**
    EncoderBufferPool is an interface for getting and returning temporary
    instances of the [EncoderBuffer] struct. This can be used to reuse buffers
    when encoding multiple images.
**/
@:go.Type({ name: "EncoderBufferPool", instanceName: "png.EncoderBufferPool", imports: ["image/png"] })
extern typedef EncoderBufferPool = {

    @:native("Get") function get(): (go.Pointer<go.image.png.EncoderBuffer>);
    @:native("Put") function put(p0: go.Pointer<go.image.png.EncoderBuffer>): Void;

}