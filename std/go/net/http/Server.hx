package go.net.http;

/**
    A Server defines parameters for running an HTTP server.
    The zero value for Server is a valid configuration.
**/
@:structInit
@:go.Type({ name: "Server", instanceName: "http.Server", imports: ["net/http"] })
extern class Server {

    @:native("Addr") var addr: String;
    @:native("Handler") var handler: go.net.http.Handler;
    @:native("DisableGeneralOptionsHandler") var disableGeneralOptionsHandler: Bool;
    @:native("TLSConfig") var tLSConfig: go.Pointer<go.crypto.tls.Config>;
    @:native("ReadTimeout") var readTimeout: go.time.Duration;
    @:native("ReadHeaderTimeout") var readHeaderTimeout: go.time.Duration;
    @:native("WriteTimeout") var writeTimeout: go.time.Duration;
    @:native("IdleTimeout") var idleTimeout: go.time.Duration;
    @:native("MaxHeaderBytes") var maxHeaderBytes: go.GoInt;
    @:native("TLSNextProto") var tLSNextProto: go.Map<String, (p0: go.Pointer<go.net.http.Server>, p1: go.Pointer<go.crypto.tls.Conn>, p2: go.net.http.Handler) -> Void>;
    @:native("ConnState") var connState: (p0: go.net.Conn, p1: go.net.http.ConnState) -> Void;
    @:native("ErrorLog") var errorLog: go.Pointer<go.log.Logger>;
    @:native("BaseContext") var baseContext: (p0: go.net.Listener) -> (go.context.Context);
    @:native("ConnContext") var connContext: (ctx: go.context.Context, c: go.net.Conn) -> (go.context.Context);
    @:native("HTTP2") var HTTP2: go.Pointer<go.net.http.HTTP2Config>;
    @:native("Protocols") var protocols: go.Pointer<go.net.http.Protocols>;

    function new(addr: String="", handler: go.net.http.Handler=null, disableGeneralOptionsHandler: Bool=false, tLSConfig: go.Pointer<go.crypto.tls.Config>=null, readTimeout: go.time.Duration=cast 0, readHeaderTimeout: go.time.Duration=cast 0, writeTimeout: go.time.Duration=cast 0, idleTimeout: go.time.Duration=cast 0, maxHeaderBytes: go.GoInt=0, tLSNextProto: go.Map<String, (p0: go.Pointer<go.net.http.Server>, p1: go.Pointer<go.crypto.tls.Conn>, p2: go.net.http.Handler) -> Void>=null, connState: (p0: go.net.Conn, p1: go.net.http.ConnState) -> Void=null, errorLog: go.Pointer<go.log.Logger>=null, baseContext: (p0: go.net.Listener) -> (go.context.Context)=null, connContext: (ctx: go.context.Context, c: go.net.Conn) -> (go.context.Context)=null, HTTP2: go.Pointer<go.net.http.HTTP2Config>=null, protocols: go.Pointer<go.net.http.Protocols>=null);

    /**
        Close immediately closes all active net.Listeners and any
        connections in state [StateNew], [StateActive], or [StateIdle]. For a
        graceful shutdown, use [Server.Shutdown].
        
        Close does not attempt to close (and does not even know about)
        any hijacked connections, such as WebSockets.
        
        Close returns any error returned from closing the [Server]'s
        underlying Listener(s).
    **/
    @:native("Close") function close(): (go.Error);
    /**
        ListenAndServe listens on the TCP network address s.Addr and then
        calls [Serve] to handle requests on incoming connections.
        Accepted connections are configured to enable TCP keep-alives.
        
        If s.Addr is blank, ":http" is used.
        
        ListenAndServe always returns a non-nil error. After [Server.Shutdown] or [Server.Close],
        the returned error is [ErrServerClosed].
    **/
    @:native("ListenAndServe") function listenAndServe(): (go.Error);
    /**
        ListenAndServeTLS listens on the TCP network address s.Addr and
        then calls [ServeTLS] to handle requests on incoming TLS connections.
        Accepted connections are configured to enable TCP keep-alives.
        
        Filenames containing a certificate and matching private key for the
        server must be provided if neither the [Server]'s TLSConfig.Certificates
        nor TLSConfig.GetCertificate are populated. If the certificate is
        signed by a certificate authority, the certFile should be the
        concatenation of the server's certificate, any intermediates, and
        the CA's certificate.
        
        If s.Addr is blank, ":https" is used.
        
        ListenAndServeTLS always returns a non-nil error. After [Server.Shutdown] or
        [Server.Close], the returned error is [ErrServerClosed].
    **/
    @:native("ListenAndServeTLS") function listenAndServeTLS(certFile: String, keyFile: String): (go.Error);
    /**
        RegisterOnShutdown registers a function to call on [Server.Shutdown].
        This can be used to gracefully shutdown connections that have
        undergone ALPN protocol upgrade or that have been hijacked.
        This function should start protocol-specific graceful shutdown,
        but should not wait for shutdown to complete.
    **/
    @:native("RegisterOnShutdown") function registerOnShutdown(f: () -> Void): Void;
    /**
        Serve accepts incoming connections on the Listener l, creating a
        new service goroutine for each. The service goroutines read requests and
        then call s.Handler to reply to them.
        
        HTTP/2 support is only enabled if the Listener returns [*tls.Conn]
        connections and they were configured with "h2" in the TLS
        Config.NextProtos.
        
        Serve always returns a non-nil error and closes l.
        After [Server.Shutdown] or [Server.Close], the returned error is [ErrServerClosed].
    **/
    @:native("Serve") function serve(l: go.net.Listener): (go.Error);
    /**
        ServeTLS accepts incoming connections on the Listener l, creating a
        new service goroutine for each. The service goroutines perform TLS
        setup and then read requests, calling s.Handler to reply to them.
        
        Files containing a certificate and matching private key for the
        server must be provided if neither the [Server]'s
        TLSConfig.Certificates, TLSConfig.GetCertificate nor
        config.GetConfigForClient are populated.
        If the certificate is signed by a certificate authority, the
        certFile should be the concatenation of the server's certificate,
        any intermediates, and the CA's certificate.
        
        ServeTLS always returns a non-nil error. After [Server.Shutdown] or [Server.Close], the
        returned error is [ErrServerClosed].
    **/
    @:native("ServeTLS") function serveTLS(l: go.net.Listener, certFile: String, keyFile: String): (go.Error);
    /**
        SetKeepAlivesEnabled controls whether HTTP keep-alives are enabled.
        By default, keep-alives are always enabled. Only very
        resource-constrained environments or servers in the process of
        shutting down should disable them.
    **/
    @:native("SetKeepAlivesEnabled") function setKeepAlivesEnabled(v: Bool): Void;
    /**
        Shutdown gracefully shuts down the server without interrupting any
        active connections. Shutdown works by first closing all open
        listeners, then closing all idle connections, and then waiting
        indefinitely for connections to return to idle and then shut down.
        If the provided context expires before the shutdown is complete,
        Shutdown returns the context's error, otherwise it returns any
        error returned from closing the [Server]'s underlying Listener(s).
        
        When Shutdown is called, [Serve], [ServeTLS], [ListenAndServe], and
        [ListenAndServeTLS] immediately return [ErrServerClosed]. Make sure the
        program doesn't exit and waits instead for Shutdown to return.
        
        Shutdown does not attempt to close nor wait for hijacked
        connections such as WebSockets. The caller of Shutdown should
        separately notify such long-lived connections of shutdown and wait
        for them to close, if desired. See [Server.RegisterOnShutdown] for a way to
        register shutdown notification functions.
        
        Once Shutdown has been called on a server, it may not be reused;
        future calls to methods such as Serve will return ErrServerClosed.
    **/
    @:native("Shutdown") function shutdown(ctx: go.context.Context): (go.Error);

}