package go.crypto.tls;

@:go.Type({ name: "marshalingFunction", instanceName: "tls.marshalingFunction", imports: ["crypto/tls"] })
extern class MarshalingFunction {

    @:native("Marshal") function marshal(b: go.Pointer<Dynamic>): (go.Error);

}