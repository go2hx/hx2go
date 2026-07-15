package go.internal.coverage;

@:structInit
@:go.Type({ name: "MetaFileHeader", instanceName: "coverage.MetaFileHeader", imports: ["internal/coverage"] })
extern class MetaFileHeader {

    @:native("Magic") var magic: go.GoArray<go.Byte, 4>;
    @:native("Version") var version: go.UInt32;
    @:native("TotalLength") var totalLength: go.UInt64;
    @:native("Entries") var entries: go.UInt64;
    @:native("MetaFileHash") var metaFileHash: go.GoArray<go.Byte, 16>;
    @:native("StrTabOffset") var strTabOffset: go.UInt32;
    @:native("StrTabLength") var strTabLength: go.UInt32;
    @:native("CMode") var cMode: go.internal.coverage.CounterMode;
    @:native("CGranularity") var cGranularity: go.internal.coverage.CounterGranularity;

function new(magic: go.GoArray<go.Byte, 4>, version: go.UInt32, totalLength: go.UInt64, entries: go.UInt64, metaFileHash: go.GoArray<go.Byte, 16>, strTabOffset: go.UInt32, strTabLength: go.UInt32, cMode: go.internal.coverage.CounterMode, cGranularity: go.internal.coverage.CounterGranularity);

}