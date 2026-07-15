package go.internal;

@:go.Type({ name: "msan", instanceName: "msan.msan", imports: ["internal/msan"] })
extern class Msan {

    @:native("Enabled") static var Enabled: Bool;

    @:native("Free") static function free(addr: go.unsafe.Pointer, sz: go.UIntPtr): Void;
    @:native("Malloc") static function malloc(addr: go.unsafe.Pointer, sz: go.UIntPtr): Void;
    @:native("Move") static function move(dst: go.unsafe.Pointer, src: go.unsafe.Pointer, sz: go.UIntPtr): Void;
    @:native("Read") static function read(addr: go.unsafe.Pointer, sz: go.UIntPtr): Void;
    @:native("Write") static function write(addr: go.unsafe.Pointer, sz: go.UIntPtr): Void;

}