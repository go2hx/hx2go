package go.vendor.golang.org.x.crypto.cryptobyte;

@:structInit
@:go.Type({ name: "BuildError", instanceName: "cryptobyte.BuildError", imports: ["vendor/golang.org/x/crypto/cryptobyte"] })
extern class BuildError {

    @:native("Err") var err: go.Error;

function new(err: go.Error);

}