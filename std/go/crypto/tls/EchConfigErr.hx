package go.crypto.tls;

@:structInit
@:go.Type({ name: "echConfigErr", instanceName: "tls.echConfigErr", imports: ["crypto/tls"] })
extern class EchConfigErr {

    @:native("Error") function error(): (String);

}