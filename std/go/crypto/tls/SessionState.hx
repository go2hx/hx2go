package go.crypto.tls;

/**
    A SessionState is a resumable session.
**/
@:structInit
@:go.Type({ name: "SessionState", instanceName: "tls.SessionState", imports: ["crypto/tls"] })
extern class SessionState {

    @:native("Extra") var extra: go.Slice<go.Slice<go.Byte>>;
    @:native("EarlyData") var earlyData: Bool;

    function new(extra: go.Slice<go.Slice<go.Byte>>=null, earlyData: Bool=false);

    /**
        Bytes encodes the session, including any private fields, so that it can be
        parsed by [ParseSessionState]. The encoding contains secret values critical
        to the security of future and possibly past sessions.
        
        The specific encoding should be considered opaque and may change incompatibly
        between Go versions.
    **/
    @:native("Bytes") function bytes(): (go.Result<go.Slice<go.Byte>>);

}