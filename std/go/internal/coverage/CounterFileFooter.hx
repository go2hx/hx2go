package go.internal.coverage;

@:structInit
@:go.Type({ name: "CounterFileFooter", instanceName: "coverage.CounterFileFooter", imports: ["internal/coverage"] })
extern class CounterFileFooter {

    @:native("Magic") var magic: go.GoArray<go.Byte, 4>;
    @:native("NumSegments") var numSegments: go.UInt32;

function new(magic: go.GoArray<go.Byte, 4>, numSegments: go.UInt32);

}