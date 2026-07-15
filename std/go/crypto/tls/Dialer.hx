package go.crypto.tls;

@:structInit
@:go.Type({ name: "Dialer", instanceName: "tls.Dialer", imports: ["crypto/tls"] })
extern class Dialer {

    @:native("NetDialer") var netDialer: go.Pointer<go.net.Dialer>;
    @:native("Config") var config: go.Pointer<go.crypto.tls.Config>;

function new(netDialer: go.Pointer<go.net.Dialer>, config: go.Pointer<go.crypto.tls.Config>);

    @:native("Dial") function dial(network: String, addr: String): go.Result<go.net.Conn>;
    @:native("DialContext") function dialContext(ctx: go.context.Context, network: String, addr: String): go.Result<go.net.Conn>;

}