package go.internal;

@:go.Type({ name: "txtar", instanceName: "txtar.txtar", imports: ["internal/txtar"] })
extern class Txtar {

    @:native("Format") static function format(a: go.Pointer<go.internal.txtar.Archive>): go.Slice<go.Byte>;
    @:native("Parse") static function parse(data: go.Slice<go.Byte>): go.Pointer<go.internal.txtar.Archive>;
    @:native("ParseFile") static function parseFile(file: String): go.Result<go.Pointer<go.internal.txtar.Archive>>;

}