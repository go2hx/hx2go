package go.internal.runtime.gc.internal;

@:go.Type({ name: "gen", instanceName: "gen.gen", imports: ["internal/runtime/gc/internal/gen"] })
extern class Gen {

    @:native("Arg") static function arg<W: go.internal.runtime.gc.internal.gen.wrap<T>, T: go.internal.runtime.gc.internal.gen.Word>(fn: go.Pointer<go.internal.runtime.gc.internal.gen.Func>): T;
    @:native("BroadcastUint64x8Zeroed") static function broadcastUint64x8Zeroed(src: go.internal.runtime.gc.internal.gen.Uint64, mask: go.internal.runtime.gc.internal.gen.Mask8): go.internal.runtime.gc.internal.gen.Uint64x8;
    @:native("ConstArray") static function constArray<T: go.internal.runtime.gc.internal.gen.Value>(vals: go.Slice<T>, name: String): go.internal.runtime.gc.internal.gen.Array<T>;
    @:native("ConstMask64") static function constMask64(c: go.UInt64): go.internal.runtime.gc.internal.gen.Mask64;
    @:native("ConstMask8") static function constMask8(c: go.UInt8): go.internal.runtime.gc.internal.gen.Mask8;
    @:native("ConstUint64") static function constUint64(c: go.UInt64, name: String): go.internal.runtime.gc.internal.gen.Uint64;
    @:native("ConstUint64x8") static function constUint64x8(c: go.GoArray<go.UInt64, 8>, name: String): go.internal.runtime.gc.internal.gen.Uint64x8;
    @:native("ConstUint8x64") static function constUint8x64(c: go.GoArray<go.UInt8, 64>, name: String): go.internal.runtime.gc.internal.gen.Uint8x64;
    @:native("Deref") static function deref<W: go.internal.runtime.gc.internal.gen.wrap<T>, T: go.internal.runtime.gc.internal.gen.Value>(ptr: go.internal.runtime.gc.internal.gen.Ptr<W>): T;
    @:native("NewFile") static function newFile(w: go.io.Writer): go.Pointer<go.internal.runtime.gc.internal.gen.File>;
    @:native("NewFunc") static function newFunc(name: String): go.Pointer<go.internal.runtime.gc.internal.gen.Func>;
    @:native("Return") static function _return(results: haxe.Rest<go.internal.runtime.gc.internal.gen.Value>): Void;

}