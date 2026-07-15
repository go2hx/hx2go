package go.internal.coverage;

@:structInit
@:go.Type({ name: "CounterFileHeader", instanceName: "coverage.CounterFileHeader", imports: ["internal/coverage"] })
extern class CounterFileHeader {

    @:native("Magic") var magic: go.GoArray<go.Byte, 4>;
    @:native("Version") var version: go.UInt32;
    @:native("MetaHash") var metaHash: go.GoArray<go.Byte, 16>;
    @:native("CFlavor") var cFlavor: go.internal.coverage.CounterFlavor;
    @:native("BigEndian") var bigEndian: Bool;

function new(magic: go.GoArray<go.Byte, 4>, version: go.UInt32, metaHash: go.GoArray<go.Byte, 16>, cFlavor: go.internal.coverage.CounterFlavor, bigEndian: Bool);

}