package go.debug;

@:go.Type({ name: "gosym", instanceName: "gosym.gosym", imports: ["debug/gosym"] })
extern class Gosym {

    @:native("NewLineTable") static function newLineTable(data: go.Slice<go.Byte>, text: go.UInt64): go.Pointer<go.debug.gosym.LineTable>;
    @:native("NewTable") static function newTable(symtab: go.Slice<go.Byte>, pcln: go.Pointer<go.debug.gosym.LineTable>): go.Result<go.Pointer<go.debug.gosym.Table>>;

}