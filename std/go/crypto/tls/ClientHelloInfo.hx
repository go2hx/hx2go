package go.crypto.tls;

@:structInit
@:go.Type({ name: "ClientHelloInfo", instanceName: "tls.ClientHelloInfo", imports: ["crypto/tls"] })
extern class ClientHelloInfo {

    @:native("CipherSuites") var cipherSuites: go.Slice<go.UInt16>;
    @:native("ServerName") var serverName: String;
    @:native("SupportedCurves") var supportedCurves: go.Slice<go.crypto.tls.CurveID>;
    @:native("SupportedPoints") var supportedPoints: go.Slice<go.UInt8>;
    @:native("SignatureSchemes") var signatureSchemes: go.Slice<go.crypto.tls.SignatureScheme>;
    @:native("SupportedProtos") var supportedProtos: go.Slice<String>;
    @:native("SupportedVersions") var supportedVersions: go.Slice<go.UInt16>;
    @:native("Extensions") var extensions: go.Slice<go.UInt16>;
    @:native("Conn") var conn: go.net.Conn;
    @:native("HelloRetryRequest") var helloRetryRequest: Bool;

    function new(cipherSuites: go.Slice<go.UInt16>=null, serverName: String="", supportedCurves: go.Slice<go.crypto.tls.CurveID>=null, supportedPoints: go.Slice<go.UInt8>=null, signatureSchemes: go.Slice<go.crypto.tls.SignatureScheme>=null, supportedProtos: go.Slice<String>=null, supportedVersions: go.Slice<go.UInt16>=null, extensions: go.Slice<go.UInt16>=null, conn: go.net.Conn=null, helloRetryRequest: Bool=false);

    @:native("Context") function context(): (go.context.Context);
    @:native("SupportsCertificate") function supportsCertificate(c: go.Pointer<go.crypto.tls.Certificate>): (go.Error);

}