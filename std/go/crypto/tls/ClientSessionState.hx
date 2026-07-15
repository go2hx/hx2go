package go.crypto.tls;

@:structInit
@:go.Type({ name: "ClientSessionState", instanceName: "tls.ClientSessionState", imports: ["crypto/tls"] })
extern class ClientSessionState {

    @:go.Tuple("ticket", "state", "err") @:native("ResumptionState") function resumptionState(): go.Tuple<{ ticket: go.Slice<go.Byte>, state: go.Pointer<go.crypto.tls.SessionState>, err: go.Error }>;

}