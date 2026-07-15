package go.internal;

@:go.Type({ name: "asan", instanceName: "asan.asan", imports: ["internal/asan"] })
extern class Asan {

    @:native("Enabled") static var Enabled: Bool;

    @:native("Read") static function read(addr: go.unsafe.Pointer, len: go.UIntPtr): Void;
    @:native("Write") static function write(addr: go.unsafe.Pointer, len: go.UIntPtr): Void;

}