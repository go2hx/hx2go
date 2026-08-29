package go.crypto.tls;

@:structInit
@:go.Type({ name: "echExtension", instanceName: "tls.echExtension", imports: ["crypto/tls"] })
extern class EchExtension {

    @:native("Type") var type: go.UInt16;
    @:native("Data") var data: go.Slice<go.Byte>;

    function new(type: go.UInt16=0, data: go.Slice<go.Byte>=null);

}