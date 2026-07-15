package go.compress;

@:go.Type({ name: "lzw", instanceName: "lzw.lzw", imports: ["compress/lzw"] })
extern class Lzw {

    @:native("LSB") static var LSB: go.compress.lzw.Order;
    @:native("MSB") static var MSB: go.compress.lzw.Order;

    @:native("NewReader") static function newReader(r: go.io.Reader, order: go.compress.lzw.Order, litWidth: go.GoInt): go.io.ReadCloser;
    @:native("NewWriter") static function newWriter(w: go.io.Writer, order: go.compress.lzw.Order, litWidth: go.GoInt): go.io.WriteCloser;

}