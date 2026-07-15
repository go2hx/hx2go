package go.go;

@:go.Type({ name: "format", instanceName: "format.format", imports: ["go/format"] })
extern class Format {

    @:native("Node") static function node(dst: go.io.Writer, fset: go.Pointer<go.go.token.FileSet>, node: Dynamic): go.Error;
    @:native("Source") static function source(src: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;

}