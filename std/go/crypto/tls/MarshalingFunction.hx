package go.crypto.tls;

@:go.Type({ name: "marshalingFunction", instanceName: "tls.marshalingFunction", imports: ["crypto/tls"] })
extern typedef MarshalingFunction = haxe.extern.EitherType<(b: go.Pointer<Dynamic>) -> (go.Error), {
    @:native("Marshal") function marshal(b: go.Pointer<Dynamic>): (go.Error);

}>