package go.crypto.tls;

@:structInit
@:go.Type({ name: "QUICConn", instanceName: "tls.QUICConn", imports: ["crypto/tls"] })
extern class QUICConn {

    @:native("Close") function close(): go.Error;
    @:native("ConnectionState") function connectionState(): go.crypto.tls.ConnectionState;
    @:native("HandleData") function handleData(level: go.crypto.tls.QUICEncryptionLevel, data: go.Slice<go.Byte>): go.Error;
    @:native("NextEvent") function nextEvent(): go.crypto.tls.QUICEvent;
    @:native("SendSessionTicket") function sendSessionTicket(opts: go.crypto.tls.QUICSessionTicketOptions): go.Error;
    @:native("SetTransportParameters") function setTransportParameters(params: go.Slice<go.Byte>): Void;
    @:native("Start") function start(ctx: go.context.Context): go.Error;
    @:native("StoreSession") function storeSession(session: go.Pointer<go.crypto.tls.SessionState>): go.Error;

}