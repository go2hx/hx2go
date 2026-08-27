package go.compress;

@:go.Type({ name: "gzip", instanceName: "gzip.gzip", imports: ["compress/gzip"] })
extern class Gzip {

    @:native("BestCompression") static var bestCompression: go.GoInt;
    @:native("BestSpeed") static var bestSpeed: go.GoInt;
    @:native("DefaultCompression") static var defaultCompression: go.GoInt;
    @:native("HuffmanOnly") static var huffmanOnly: go.GoInt;
    @:native("NoCompression") static var noCompression: go.GoInt;

    @:native("NewReader") static function newReader(r: go.io.Reader): (go.Result<go.Pointer<go.compress.gzip.Reader>>);
    @:native("NewWriter") static function newWriter(w: go.io.Writer): (go.Pointer<go.compress.gzip.Writer>);
    @:native("NewWriterLevel") static function newWriterLevel(w: go.io.Writer, level: go.GoInt): (go.Result<go.Pointer<go.compress.gzip.Writer>>);

}