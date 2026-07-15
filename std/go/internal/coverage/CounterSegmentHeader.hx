package go.internal.coverage;

@:structInit
@:go.Type({ name: "CounterSegmentHeader", instanceName: "coverage.CounterSegmentHeader", imports: ["internal/coverage"] })
extern class CounterSegmentHeader {

    @:native("FcnEntries") var fcnEntries: go.UInt64;
    @:native("StrTabLen") var strTabLen: go.UInt32;
    @:native("ArgsLen") var argsLen: go.UInt32;

function new(fcnEntries: go.UInt64, strTabLen: go.UInt32, argsLen: go.UInt32);

}