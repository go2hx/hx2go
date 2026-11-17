package go.image.png;

/**
    Encoder configures encoding PNG images.
**/
@:structInit
@:go.Type({ name: "Encoder", instanceName: "png.Encoder", imports: ["image/png"] })
extern class Encoder {

    @:native("CompressionLevel") var compressionLevel: go.image.png.CompressionLevel;
    @:native("BufferPool") var bufferPool: go.image.png.EncoderBufferPool;

    function new(compressionLevel: go.image.png.CompressionLevel=cast 0, bufferPool: go.image.png.EncoderBufferPool=null);

    /**
        Encode writes the Image m to w in PNG format.
        
        Note that the exact bytes written to w are not covered by the Go 1
        compatibility promise. Callers, including tests, should not depend on the
        exact written bytes.
    **/
    @:native("Encode") function encode(w: go.io.Writer, m: go.image.Image): (go.Error);

}