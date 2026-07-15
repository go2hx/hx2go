package go.internal.runtime;

@:go.Type({ name: "atomic", instanceName: "atomic.atomic", imports: ["internal/runtime/atomic"] })
extern class Atomic {

    @:native("And") static function and(ptr: go.Pointer<go.UInt32>, val: go.UInt32): Void;
    @:native("And32") static function and32(ptr: go.Pointer<go.UInt32>, val: go.UInt32): go.UInt32;
    @:native("And64") static function and64(ptr: go.Pointer<go.UInt64>, val: go.UInt64): go.UInt64;
    @:native("And8") static function and8(ptr: go.Pointer<go.UInt8>, val: go.UInt8): Void;
    @:native("Anduintptr") static function anduintptr(ptr: go.Pointer<go.UIntPtr>, val: go.UIntPtr): go.UIntPtr;
    @:native("Cas") static function cas(ptr: go.Pointer<go.UInt32>, old: go.UInt32, _new: go.UInt32): Bool;
    @:native("Cas64") static function cas64(ptr: go.Pointer<go.UInt64>, old: go.UInt64, _new: go.UInt64): Bool;
    @:native("CasRel") static function casRel(ptr: go.Pointer<go.UInt32>, old: go.UInt32, _new: go.UInt32): Bool;
    @:native("Casint32") static function casint32(ptr: go.Pointer<go.Int32>, old: go.Int32, _new: go.Int32): Bool;
    @:native("Casint64") static function casint64(ptr: go.Pointer<go.Int64>, old: go.Int64, _new: go.Int64): Bool;
    @:native("Casp1") static function casp1(ptr: go.Pointer<go.unsafe.Pointer>, old: go.unsafe.Pointer, _new: go.unsafe.Pointer): Bool;
    @:native("Casuintptr") static function casuintptr(ptr: go.Pointer<go.UIntPtr>, old: go.UIntPtr, _new: go.UIntPtr): Bool;
    @:native("Load") static function load(ptr: go.Pointer<go.UInt32>): go.UInt32;
    @:native("Load64") static function load64(ptr: go.Pointer<go.UInt64>): go.UInt64;
    @:native("Load8") static function load8(ptr: go.Pointer<go.UInt8>): go.UInt8;
    @:native("LoadAcq") static function loadAcq(ptr: go.Pointer<go.UInt32>): go.UInt32;
    @:native("LoadAcq64") static function loadAcq64(ptr: go.Pointer<go.UInt64>): go.UInt64;
    @:native("LoadAcquintptr") static function loadAcquintptr(ptr: go.Pointer<go.UIntPtr>): go.UIntPtr;
    @:native("Loadint32") static function loadint32(ptr: go.Pointer<go.Int32>): go.Int32;
    @:native("Loadint64") static function loadint64(ptr: go.Pointer<go.Int64>): go.Int64;
    @:native("Loadp") static function loadp(ptr: go.unsafe.Pointer): go.unsafe.Pointer;
    @:native("Loaduint") static function loaduint(ptr: go.Pointer<go.GoUInt>): go.GoUInt;
    @:native("Loaduintptr") static function loaduintptr(ptr: go.Pointer<go.UIntPtr>): go.UIntPtr;
    @:native("Or") static function or(ptr: go.Pointer<go.UInt32>, val: go.UInt32): Void;
    @:native("Or32") static function or32(ptr: go.Pointer<go.UInt32>, val: go.UInt32): go.UInt32;
    @:native("Or64") static function or64(ptr: go.Pointer<go.UInt64>, val: go.UInt64): go.UInt64;
    @:native("Or8") static function or8(ptr: go.Pointer<go.UInt8>, val: go.UInt8): Void;
    @:native("Oruintptr") static function oruintptr(ptr: go.Pointer<go.UIntPtr>, val: go.UIntPtr): go.UIntPtr;
    @:native("Store") static function store(ptr: go.Pointer<go.UInt32>, val: go.UInt32): Void;
    @:native("Store64") static function store64(ptr: go.Pointer<go.UInt64>, val: go.UInt64): Void;
    @:native("Store8") static function store8(ptr: go.Pointer<go.UInt8>, val: go.UInt8): Void;
    @:native("StoreRel") static function storeRel(ptr: go.Pointer<go.UInt32>, val: go.UInt32): Void;
    @:native("StoreRel64") static function storeRel64(ptr: go.Pointer<go.UInt64>, val: go.UInt64): Void;
    @:native("StoreReluintptr") static function storeReluintptr(ptr: go.Pointer<go.UIntPtr>, val: go.UIntPtr): Void;
    @:native("Storeint32") static function storeint32(ptr: go.Pointer<go.Int32>, _new: go.Int32): Void;
    @:native("Storeint64") static function storeint64(ptr: go.Pointer<go.Int64>, _new: go.Int64): Void;
    @:native("StorepNoWB") static function storepNoWB(ptr: go.unsafe.Pointer, val: go.unsafe.Pointer): Void;
    @:native("Storeuintptr") static function storeuintptr(ptr: go.Pointer<go.UIntPtr>, _new: go.UIntPtr): Void;
    @:native("Xadd") static function xadd(ptr: go.Pointer<go.UInt32>, delta: go.Int32): go.UInt32;
    @:native("Xadd64") static function xadd64(ptr: go.Pointer<go.UInt64>, delta: go.Int64): go.UInt64;
    @:native("Xaddint32") static function xaddint32(ptr: go.Pointer<go.Int32>, delta: go.Int32): go.Int32;
    @:native("Xaddint64") static function xaddint64(ptr: go.Pointer<go.Int64>, delta: go.Int64): go.Int64;
    @:native("Xadduintptr") static function xadduintptr(ptr: go.Pointer<go.UIntPtr>, delta: go.UIntPtr): go.UIntPtr;
    @:native("Xchg") static function xchg(ptr: go.Pointer<go.UInt32>, _new: go.UInt32): go.UInt32;
    @:native("Xchg64") static function xchg64(ptr: go.Pointer<go.UInt64>, _new: go.UInt64): go.UInt64;
    @:native("Xchg8") static function xchg8(ptr: go.Pointer<go.UInt8>, _new: go.UInt8): go.UInt8;
    @:native("Xchgint32") static function xchgint32(ptr: go.Pointer<go.Int32>, _new: go.Int32): go.Int32;
    @:native("Xchgint64") static function xchgint64(ptr: go.Pointer<go.Int64>, _new: go.Int64): go.Int64;
    @:native("Xchguintptr") static function xchguintptr(ptr: go.Pointer<go.UIntPtr>, _new: go.UIntPtr): go.UIntPtr;

}