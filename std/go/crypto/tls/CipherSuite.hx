package go.crypto.tls;

/**
    CipherSuite is a TLS cipher suite. Note that most functions in this package
    accept and expose cipher suite IDs instead of this type.
**/
@:structInit
@:go.Type({ name: "CipherSuite", instanceName: "tls.CipherSuite", imports: ["crypto/tls"] })
extern class CipherSuite {

    @:native("ID") var ID: go.UInt16;
    @:native("Name") var name: String;
    @:native("SupportedVersions") var supportedVersions: go.Slice<go.UInt16>;
    @:native("Insecure") var insecure: Bool;

    function new(ID: go.UInt16=0, name: String="", supportedVersions: go.Slice<go.UInt16>=null, insecure: Bool=false);

}