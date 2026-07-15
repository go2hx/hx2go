package go.internal.coverage.rtcov;

@:structInit
@:go.Type({ name: "CovCounterBlob", instanceName: "rtcov.CovCounterBlob", imports: ["internal/coverage/rtcov"] })
extern class CovCounterBlob {

    @:native("Counters") var counters: go.Pointer<go.UInt32>;
    @:native("Len") var len: go.UInt64;

function new(counters: go.Pointer<go.UInt32>, len: go.UInt64);

}