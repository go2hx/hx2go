package go.compress;

@:go.Type({ name: "gzip", instanceName: "gzip.gzip", imports: ["compress/gzip"] })
extern class Gzip {

    @:native("BestCompression") static var BestCompression: go.GoInt;
    @:native("BestSpeed") static var BestSpeed: go.GoInt;
    @:native("DefaultCompression") static var DefaultCompression: go.GoInt;
    @:native("HuffmanOnly") static var HuffmanOnly: go.GoInt;
    @:native("NoCompression") static var NoCompression: go.GoInt;

    @:native("NewReader") static function newReader(r: go.io.Reader): go.Result<go.Pointer<go.compress.gzip.Reader>>;
    @:native("NewWriter") static function newWriter(w: go.io.Writer): go.Pointer<go.compress.gzip.Writer>;
    @:native("NewWriterLevel") static function newWriterLevel(w: go.io.Writer, level: go.GoInt): go.Result<go.Pointer<go.compress.gzip.Writer>>;

}