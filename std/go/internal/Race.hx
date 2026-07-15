package go.internal;

@:go.Type({ name: "race", instanceName: "race.race", imports: ["internal/race"] })
extern class Race {

    @:native("Enabled") static var Enabled: Bool;

    @:native("Acquire") static function acquire(addr: go.unsafe.Pointer): Void;
    @:native("Disable") static function disable(): Void;
    @:native("Enable") static function enable(): Void;
    @:native("Errors") static function errors(): go.GoInt;
    @:native("Read") static function read(addr: go.unsafe.Pointer): Void;
    @:native("ReadObjectPC") static function readObjectPC(t: go.Pointer<go.internal.abi.Type>, addr: go.unsafe.Pointer, callerpc: go.UIntPtr, pc: go.UIntPtr): Void;
    @:native("ReadPC") static function readPC(addr: go.unsafe.Pointer, callerpc: go.UIntPtr, pc: go.UIntPtr): Void;
    @:native("ReadRange") static function readRange(addr: go.unsafe.Pointer, len: go.GoInt): Void;
    @:native("Release") static function release(addr: go.unsafe.Pointer): Void;
    @:native("ReleaseMerge") static function releaseMerge(addr: go.unsafe.Pointer): Void;
    @:native("Write") static function write(addr: go.unsafe.Pointer): Void;
    @:native("WriteObjectPC") static function writeObjectPC(t: go.Pointer<go.internal.abi.Type>, addr: go.unsafe.Pointer, callerpc: go.UIntPtr, pc: go.UIntPtr): Void;
    @:native("WritePC") static function writePC(addr: go.unsafe.Pointer, callerpc: go.UIntPtr, pc: go.UIntPtr): Void;
    @:native("WriteRange") static function writeRange(addr: go.unsafe.Pointer, len: go.GoInt): Void;

}