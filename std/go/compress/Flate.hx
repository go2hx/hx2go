package go.compress;

@:go.Type({ name: "flate", instanceName: "flate.flate", imports: ["compress/flate"] })
extern class Flate {

    @:native("BestCompression") static var BestCompression: go.GoInt;
    @:native("BestSpeed") static var BestSpeed: go.GoInt;
    @:native("DefaultCompression") static var DefaultCompression: go.GoInt;
    @:native("HuffmanOnly") static var HuffmanOnly: go.GoInt;
    @:native("NoCompression") static var NoCompression: go.GoInt;

    @:native("NewReader") static function newReader(r: go.io.Reader): go.io.ReadCloser;
    @:native("NewReaderDict") static function newReaderDict(r: go.io.Reader, dict: go.Slice<go.Byte>): go.io.ReadCloser;
    @:native("NewWriter") static function newWriter(w: go.io.Writer, level: go.GoInt): go.Result<go.Pointer<go.compress.flate.Writer>>;
    @:native("NewWriterDict") static function newWriterDict(w: go.io.Writer, level: go.GoInt, dict: go.Slice<go.Byte>): go.Result<go.Pointer<go.compress.flate.Writer>>;

}