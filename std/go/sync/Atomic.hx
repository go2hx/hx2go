package go.sync;

@:go.Type({ name: "atomic", instanceName: "atomic.atomic", imports: ["sync/atomic"] })
extern class Atomic {

    @:native("AddInt32") static function addInt32(addr: go.Pointer<go.Int32>, delta: go.Int32): go.Int32;
    @:native("AddInt64") static function addInt64(addr: go.Pointer<go.Int64>, delta: go.Int64): go.Int64;
    @:native("AddUint32") static function addUint32(addr: go.Pointer<go.UInt32>, delta: go.UInt32): go.UInt32;
    @:native("AddUint64") static function addUint64(addr: go.Pointer<go.UInt64>, delta: go.UInt64): go.UInt64;
    @:native("AddUintptr") static function addUintptr(addr: go.Pointer<go.UIntPtr>, delta: go.UIntPtr): go.UIntPtr;
    @:native("AndInt32") static function andInt32(addr: go.Pointer<go.Int32>, mask: go.Int32): go.Int32;
    @:native("AndInt64") static function andInt64(addr: go.Pointer<go.Int64>, mask: go.Int64): go.Int64;
    @:native("AndUint32") static function andUint32(addr: go.Pointer<go.UInt32>, mask: go.UInt32): go.UInt32;
    @:native("AndUint64") static function andUint64(addr: go.Pointer<go.UInt64>, mask: go.UInt64): go.UInt64;
    @:native("AndUintptr") static function andUintptr(addr: go.Pointer<go.UIntPtr>, mask: go.UIntPtr): go.UIntPtr;
    @:native("CompareAndSwapInt32") static function compareAndSwapInt32(addr: go.Pointer<go.Int32>, old: go.Int32, _new: go.Int32): Bool;
    @:native("CompareAndSwapInt64") static function compareAndSwapInt64(addr: go.Pointer<go.Int64>, old: go.Int64, _new: go.Int64): Bool;
    @:native("CompareAndSwapPointer") static function compareAndSwapPointer(addr: go.Pointer<go.unsafe.Pointer>, old: go.unsafe.Pointer, _new: go.unsafe.Pointer): Bool;
    @:native("CompareAndSwapUint32") static function compareAndSwapUint32(addr: go.Pointer<go.UInt32>, old: go.UInt32, _new: go.UInt32): Bool;
    @:native("CompareAndSwapUint64") static function compareAndSwapUint64(addr: go.Pointer<go.UInt64>, old: go.UInt64, _new: go.UInt64): Bool;
    @:native("CompareAndSwapUintptr") static function compareAndSwapUintptr(addr: go.Pointer<go.UIntPtr>, old: go.UIntPtr, _new: go.UIntPtr): Bool;
    @:native("LoadInt32") static function loadInt32(addr: go.Pointer<go.Int32>): go.Int32;
    @:native("LoadInt64") static function loadInt64(addr: go.Pointer<go.Int64>): go.Int64;
    @:native("LoadPointer") static function loadPointer(addr: go.Pointer<go.unsafe.Pointer>): go.unsafe.Pointer;
    @:native("LoadUint32") static function loadUint32(addr: go.Pointer<go.UInt32>): go.UInt32;
    @:native("LoadUint64") static function loadUint64(addr: go.Pointer<go.UInt64>): go.UInt64;
    @:native("LoadUintptr") static function loadUintptr(addr: go.Pointer<go.UIntPtr>): go.UIntPtr;
    @:native("OrInt32") static function orInt32(addr: go.Pointer<go.Int32>, mask: go.Int32): go.Int32;
    @:native("OrInt64") static function orInt64(addr: go.Pointer<go.Int64>, mask: go.Int64): go.Int64;
    @:native("OrUint32") static function orUint32(addr: go.Pointer<go.UInt32>, mask: go.UInt32): go.UInt32;
    @:native("OrUint64") static function orUint64(addr: go.Pointer<go.UInt64>, mask: go.UInt64): go.UInt64;
    @:native("OrUintptr") static function orUintptr(addr: go.Pointer<go.UIntPtr>, mask: go.UIntPtr): go.UIntPtr;
    @:native("StoreInt32") static function storeInt32(addr: go.Pointer<go.Int32>, val: go.Int32): Void;
    @:native("StoreInt64") static function storeInt64(addr: go.Pointer<go.Int64>, val: go.Int64): Void;
    @:native("StorePointer") static function storePointer(addr: go.Pointer<go.unsafe.Pointer>, val: go.unsafe.Pointer): Void;
    @:native("StoreUint32") static function storeUint32(addr: go.Pointer<go.UInt32>, val: go.UInt32): Void;
    @:native("StoreUint64") static function storeUint64(addr: go.Pointer<go.UInt64>, val: go.UInt64): Void;
    @:native("StoreUintptr") static function storeUintptr(addr: go.Pointer<go.UIntPtr>, val: go.UIntPtr): Void;
    @:native("SwapInt32") static function swapInt32(addr: go.Pointer<go.Int32>, _new: go.Int32): go.Int32;
    @:native("SwapInt64") static function swapInt64(addr: go.Pointer<go.Int64>, _new: go.Int64): go.Int64;
    @:native("SwapPointer") static function swapPointer(addr: go.Pointer<go.unsafe.Pointer>, _new: go.unsafe.Pointer): go.unsafe.Pointer;
    @:native("SwapUint32") static function swapUint32(addr: go.Pointer<go.UInt32>, _new: go.UInt32): go.UInt32;
    @:native("SwapUint64") static function swapUint64(addr: go.Pointer<go.UInt64>, _new: go.UInt64): go.UInt64;
    @:native("SwapUintptr") static function swapUintptr(addr: go.Pointer<go.UIntPtr>, _new: go.UIntPtr): go.UIntPtr;

}