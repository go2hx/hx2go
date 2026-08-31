package go.crypto.tls;

/**
    A QUICConfig configures a [QUICConn].
**/
@:structInit
@:go.Type({ name: "QUICConfig", instanceName: "tls.QUICConfig", imports: ["crypto/tls"] })
extern class QUICConfig {

    @:native("TLSConfig") var tLSConfig: go.Pointer<go.crypto.tls.Config>;
    @:native("EnableSessionEvents") var enableSessionEvents: Bool;

    function new(tLSConfig: go.Pointer<go.crypto.tls.Config>=null, enableSessionEvents: Bool=false);

}