package go.crypto.internal;

@:go.Type({ name: "sysrand", instanceName: "sysrand.sysrand", imports: ["crypto/internal/sysrand"] })
extern class Sysrand {

    @:native("Read") static function read(b: go.Slice<go.Byte>): Void;

}