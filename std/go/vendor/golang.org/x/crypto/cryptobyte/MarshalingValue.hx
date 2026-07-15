package go.vendor.golang.org.x.crypto.cryptobyte;

@:go.Type({ name: "MarshalingValue", instanceName: "cryptobyte.MarshalingValue", imports: ["vendor/golang.org/x/crypto/cryptobyte"] })
extern typedef MarshalingValue = {

    @:native("Marshal") function marshal(b: go.Pointer<go.vendor.golang.org.x.crypto.cryptobyte.Builder>): go.Error;

}