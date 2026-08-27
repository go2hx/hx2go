package go.image.png;

@:structInit
@:go.Type({ name: "Encoder", instanceName: "png.Encoder", imports: ["image/png"] })
extern class Encoder {

    @:native("CompressionLevel") var compressionLevel: go.image.png.CompressionLevel;
    @:native("BufferPool") var bufferPool: go.image.png.EncoderBufferPool;

    function new(compressionLevel: go.image.png.CompressionLevel=cast 0, bufferPool: go.image.png.EncoderBufferPool=null);

    @:native("Encode") function encode(w: go.io.Writer, m: go.image.Image): (go.Error);

}