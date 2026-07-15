package go.os.exec.internal;

@:go.Type({ name: "fdtest", instanceName: "fdtest.fdtest", imports: ["os/exec/internal/fdtest"] })
extern class Fdtest {

    @:native("Exists") static function exists(fd: go.UIntPtr): Bool;

}