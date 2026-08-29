package go.crypto.tls;

/**
    A QUICConn represents a connection which uses a QUIC implementation as the underlying
    transport as described in RFC 9001.
    
    Methods of QUICConn are not safe for concurrent use.
**/
@:structInit
@:go.Type({ name: "QUICConn", instanceName: "tls.QUICConn", imports: ["crypto/tls"] })
extern class QUICConn {

    /**
        Close closes the connection and stops any in-progress handshake.
    **/
    @:native("Close") function close(): (go.Error);
    /**
        ConnectionState returns basic TLS details about the connection.
    **/
    @:native("ConnectionState") function connectionState(): (go.crypto.tls.ConnectionState);
    /**
        HandleData handles handshake bytes received from the peer.
        It may produce connection events, which may be read with [QUICConn.NextEvent].
    **/
    @:native("HandleData") function handleData(level: go.crypto.tls.QUICEncryptionLevel, data: go.Slice<go.Byte>): (go.Error);
    /**
        NextEvent returns the next event occurring on the connection.
        It returns an event with a Kind of [QUICNoEvent] when no events are available.
    **/
    @:native("NextEvent") function nextEvent(): (go.crypto.tls.QUICEvent);
    /**
        SendSessionTicket sends a session ticket to the client.
        It produces connection events, which may be read with [QUICConn.NextEvent].
        Currently, it can only be called once.
    **/
    @:native("SendSessionTicket") function sendSessionTicket(opts: go.crypto.tls.QUICSessionTicketOptions): (go.Error);
    /**
        SetTransportParameters sets the transport parameters to send to the peer.
        
        Server connections may delay setting the transport parameters until after
        receiving the client's transport parameters. See [QUICTransportParametersRequired].
    **/
    @:native("SetTransportParameters") function setTransportParameters(params: go.Slice<go.Byte>): Void;
    /**
        Start starts the client or server handshake protocol.
        It may produce connection events, which may be read with [QUICConn.NextEvent].
        
        Start must be called at most once.
    **/
    @:native("Start") function start(ctx: go.context.Context): (go.Error);
    /**
        StoreSession stores a session previously received in a QUICStoreSession event
        in the ClientSessionCache.
        The application may process additional events or modify the SessionState
        before storing the session.
    **/
    @:native("StoreSession") function storeSession(session: go.Pointer<go.crypto.tls.SessionState>): (go.Error);

}