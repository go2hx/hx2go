import go.Float32;
import go.Slice;

@:go.Type({ name: "simd", instanceName: "simd.simd", imports: ["simd"] })
extern class Simd {
    @:native("BroadcastFloat32s") static function broadcastFloat32s(x: Float32): Float32s;
    @:native("LoadFloat32s") static function loadFloat32s(s: Slice<Float32>): Float32s;
}

@:structInit
@:go.Type({ name: "Float32s", instanceName: "simd.Float32s", imports: ["simd"] })
extern class Float32s {
    @:native("Len") function len(): go.GoInt;
    @:native("Add") function add(y: Float32s): Float32s;
    @:native("Store") function store(s: Slice<Float32>): Void;
}

function main() {
    var data = new Slice<Float32>(4096);
    for (i in 0...4096) data[i] = 1;

    var start = Sys.time();
    var sum: Float32 = 0;
    for (_ in 0...50000) {
        sum = 0;
        for (i in 0...4096) sum += data[i];
    }

    var scalar = Sys.time() - start;
    start = Sys.time();

    var lanes = new Slice<Float32>(16);
    for (_ in 0...50000) {
        var acc = Simd.broadcastFloat32s(0);
        var n: Int = acc.len();
        var i = 0;

        while (i < 4096) {
            acc = acc.add(Simd.loadFloat32s(data.slice(i, i + n)));
            i += n;
        }

        acc.store(lanes);
    }

    var simd = Sys.time() - start;
    Sys.println('scalar: ${Math.round(scalar * 1000)} ms, simd: ${Math.round(simd * 1000)} ms, speedup: ${Math.round(scalar / simd * 10) / 10}x');
}