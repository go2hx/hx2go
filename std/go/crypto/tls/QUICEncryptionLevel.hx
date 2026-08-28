package go.crypto.tls;

/**
    QUICEncryptionLevel represents a QUIC encryption level used to transmit
    handshake messages.
**/
@:go.Type({ name: "QUICEncryptionLevel", instanceName: "tls.QUICEncryptionLevel", imports: ["crypto/tls"] })
extern typedef QUICEncryptionLevel = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>