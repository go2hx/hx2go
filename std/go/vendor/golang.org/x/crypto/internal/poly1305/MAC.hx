package go.vendor.golang.org.x.crypto.internal.poly1305;

@:structInit
@:go.Type({ name: "MAC", instanceName: "poly1305.MAC", imports: ["vendor/golang.org/x/crypto/internal/poly1305"] })
extern class MAC {

    @:native("Size") function size(): go.GoInt;
    @:native("Sum") function sum(b: go.Slice<go.Byte>): go.Slice<go.Byte>;
    @:native("Verify") function verify(expected: go.Slice<go.Byte>): Bool;
    @:native("Write") function write(p: go.Slice<go.Byte>): go.Result<go.GoInt>;

}