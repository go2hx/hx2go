package go.internal.coverage;

@:go.Type({ name: "rtcov", instanceName: "rtcov.rtcov", imports: ["internal/coverage/rtcov"] })
extern class Rtcov {

    @:native("Meta") static var Meta: Dynamic;

    @:native("AddMeta") static function addMeta(p: go.unsafe.Pointer, dlen: go.UInt32, hash: go.GoArray<go.Byte, 16>, pkgpath: String, pkgid: go.GoInt, cmode: go.UInt8, cgran: go.UInt8): go.UInt32;

}