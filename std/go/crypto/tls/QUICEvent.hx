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

function new(kind: go.crypto.tls.QUICEventKind, level: go.crypto.tls.QUICEncryptionLevel, data: go.Slice<go.Byte>, suite: go.UInt16, sessionState: go.Pointer<go.crypto.tls.SessionState>, err: go.Error);

}