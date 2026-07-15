package go.vendor.golang.org.x.crypto.internal;

@:go.Type({ name: "poly1305", instanceName: "poly1305.poly1305", imports: ["vendor/golang.org/x/crypto/internal/poly1305"] })
extern class Poly1305 {

    @:native("TagSize") static var TagSize: go.GoInt;

    @:native("New") static function _new(key: go.Pointer<go.GoArray<go.Byte, 32>>): go.Pointer<go.vendor.golang.org.x.crypto.internal.poly1305.MAC>;
    @:native("Sum") static function sum(out: go.Pointer<go.GoArray<go.Byte, 16>>, m: go.Slice<go.Byte>, key: go.Pointer<go.GoArray<go.Byte, 32>>): Void;
    @:native("Verify") static function verify(mac: go.Pointer<go.GoArray<go.Byte, 16>>, m: go.Slice<go.Byte>, key: go.Pointer<go.GoArray<go.Byte, 32>>): Bool;

}