package go.vendor.golang.org.x.crypto;

@:go.Type({ name: "cryptobyte", instanceName: "cryptobyte.cryptobyte", imports: ["vendor/golang.org/x/crypto/cryptobyte"] })
extern class Cryptobyte {

    @:native("NewBuilder") static function newBuilder(buffer: go.Slice<go.Byte>): go.Pointer<go.vendor.golang.org.x.crypto.cryptobyte.Builder>;
    @:native("NewFixedBuilder") static function newFixedBuilder(buffer: go.Slice<go.Byte>): go.Pointer<go.vendor.golang.org.x.crypto.cryptobyte.Builder>;

}