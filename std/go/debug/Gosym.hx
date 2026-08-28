package go.debug;

/**
    Package gosym implements access to the Go symbol
    and line number tables embedded in Go binaries generated
    by the gc compilers.
**/
@:go.Type({ name: "gosym", instanceName: "gosym.gosym", imports: ["debug/gosym"] })
extern class Gosym {

    /**
        NewLineTable returns a new PC/line table
        corresponding to the encoded data.
        Text must be the start address of the
        corresponding text segment, with the exact
        value stored in the 'runtime.text' symbol.
        This value may differ from the start
        address of the text segment if
        binary was built with cgo enabled.
    **/
    @:native("NewLineTable") static function newLineTable(data: go.Slice<go.Byte>, text: go.UInt64): (go.Pointer<go.debug.gosym.LineTable>);
    /**
        NewTable decodes the Go symbol table (the ".gosymtab" section in ELF),
        returning an in-memory representation.
        Starting with Go 1.3, the Go symbol table no longer includes symbol data;
        callers should pass nil for the symtab parameter.
    **/
    @:native("NewTable") static function newTable(symtab: go.Slice<go.Byte>, pcln: go.Pointer<go.debug.gosym.LineTable>): (go.Result<go.Pointer<go.debug.gosym.Table>>);

}