package go.testing;

@:structInit
@:go.Type({ name: "CoverBlock", instanceName: "testing.CoverBlock", imports: ["testing"] })
extern class CoverBlock {

    @:native("Line0") var line0: go.UInt32;
    @:native("Col0") var col0: go.UInt16;
    @:native("Line1") var line1: go.UInt32;
    @:native("Col1") var col1: go.UInt16;
    @:native("Stmts") var stmts: go.UInt16;

function new(line0: go.UInt32, col0: go.UInt16, line1: go.UInt32, col1: go.UInt16, stmts: go.UInt16);

}