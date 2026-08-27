package go.crypto.tls;

@:structInit
@:go.Type({ name: "QUICEvent", instanceName: "tls.QUICEvent", imports: ["crypto/tls"] })
extern class QUICEvent {

    @:native("Kind") var kind: go.crypto.tls.QUICEventKind;
    @:native("Level") var level: go.crypto.tls.QUICEncryptionLevel;
    @:native("Data") var data: go.Slice<go.Byte>;
    @:native("Suite") var suite: go.UInt16;
    @:native("SessionState") var sessionState: go.Pointer<go.crypto.tls.SessionState>;
    @:native("Err") var err: go.Error;

    function new(kind: go.crypto.tls.QUICEventKind=cast 0, level: go.crypto.tls.QUICEncryptionLevel=cast 0, data: go.Slice<go.Byte>=null, suite: go.UInt16=0, sessionState: go.Pointer<go.crypto.tls.SessionState>=null, err: go.Error=null);

}