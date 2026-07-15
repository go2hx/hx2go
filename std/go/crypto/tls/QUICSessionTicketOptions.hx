package go.crypto.tls;

@:structInit
@:go.Type({ name: "QUICSessionTicketOptions", instanceName: "tls.QUICSessionTicketOptions", imports: ["crypto/tls"] })
extern class QUICSessionTicketOptions {

    @:native("EarlyData") var earlyData: Bool;
    @:native("Extra") var extra: go.Slice<go.Slice<go.Byte>>;

function new(earlyData: Bool, extra: go.Slice<go.Slice<go.Byte>>);

}