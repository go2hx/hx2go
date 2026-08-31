package go.crypto.tls;

/**
    ClientSessionState contains the state needed by a client to
    resume a previous TLS session.
**/
@:structInit
@:go.Type({ name: "ClientSessionState", instanceName: "tls.ClientSessionState", imports: ["crypto/tls"] })
extern class ClientSessionState {

    /**
        ResumptionState returns the session ticket sent by the server (also known as
        the session's identity) and the state necessary to resume this session.
        
        It can be called by [ClientSessionCache.Put] to serialize (with
        [SessionState.Bytes]) and store the session.
    **/
    @:go.Tuple("ticket", "state", "err") @:native("ResumptionState") function resumptionState(): (go.Tuple<{ ticket: go.Slice<go.Byte>, state: go.Pointer<go.crypto.tls.SessionState>, err: go.Error }>);

}