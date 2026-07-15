package go.runtime;

@:structInit
@:go.Type({ name: "MemStats", instanceName: "runtime.MemStats", imports: ["runtime"] })
extern class MemStats {

    @:native("Alloc") var alloc: go.UInt64;
    @:native("TotalAlloc") var totalAlloc: go.UInt64;
    @:native("Sys") var sys: go.UInt64;
    @:native("Lookups") var lookups: go.UInt64;
    @:native("Mallocs") var mallocs: go.UInt64;
    @:native("Frees") var frees: go.UInt64;
    @:native("HeapAlloc") var heapAlloc: go.UInt64;
    @:native("HeapSys") var heapSys: go.UInt64;
    @:native("HeapIdle") var heapIdle: go.UInt64;
    @:native("HeapInuse") var heapInuse: go.UInt64;
    @:native("HeapReleased") var heapReleased: go.UInt64;
    @:native("HeapObjects") var heapObjects: go.UInt64;
    @:native("StackInuse") var stackInuse: go.UInt64;
    @:native("StackSys") var stackSys: go.UInt64;
    @:native("MSpanInuse") var mSpanInuse: go.UInt64;
    @:native("MSpanSys") var mSpanSys: go.UInt64;
    @:native("MCacheInuse") var mCacheInuse: go.UInt64;
    @:native("MCacheSys") var mCacheSys: go.UInt64;
    @:native("BuckHashSys") var buckHashSys: go.UInt64;
    @:native("GCSys") var gCSys: go.UInt64;
    @:native("OtherSys") var otherSys: go.UInt64;
    @:native("NextGC") var nextGC: go.UInt64;
    @:native("LastGC") var lastGC: go.UInt64;
    @:native("PauseTotalNs") var pauseTotalNs: go.UInt64;
    @:native("PauseNs") var pauseNs: go.GoArray<go.UInt64, 256>;
    @:native("PauseEnd") var pauseEnd: go.GoArray<go.UInt64, 256>;
    @:native("NumGC") var numGC: go.UInt32;
    @:native("NumForcedGC") var numForcedGC: go.UInt32;
    @:native("GCCPUFraction") var gCCPUFraction: Float;
    @:native("EnableGC") var enableGC: Bool;
    @:native("DebugGC") var debugGC: Bool;
    @:native("BySize") var bySize: go.GoArray<Dynamic, 61>;

function new(alloc: go.UInt64, totalAlloc: go.UInt64, sys: go.UInt64, lookups: go.UInt64, mallocs: go.UInt64, frees: go.UInt64, heapAlloc: go.UInt64, heapSys: go.UInt64, heapIdle: go.UInt64, heapInuse: go.UInt64, heapReleased: go.UInt64, heapObjects: go.UInt64, stackInuse: go.UInt64, stackSys: go.UInt64, mSpanInuse: go.UInt64, mSpanSys: go.UInt64, mCacheInuse: go.UInt64, mCacheSys: go.UInt64, buckHashSys: go.UInt64, gCSys: go.UInt64, otherSys: go.UInt64, nextGC: go.UInt64, lastGC: go.UInt64, pauseTotalNs: go.UInt64, pauseNs: go.GoArray<go.UInt64, 256>, pauseEnd: go.GoArray<go.UInt64, 256>, numGC: go.UInt32, numForcedGC: go.UInt32, gCCPUFraction: Float, enableGC: Bool, debugGC: Bool, bySize: go.GoArray<Dynamic, 61>);

}