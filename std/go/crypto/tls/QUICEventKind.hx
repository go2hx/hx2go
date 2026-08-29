package go.crypto.tls;

/**
    A QUICEventKind is a type of operation on a QUIC connection.
**/
@:go.Type({ name: "QUICEventKind", instanceName: "tls.QUICEventKind", imports: ["crypto/tls"] })
extern typedef QUICEventKind = go.GoInt