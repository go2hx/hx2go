package go.net.http;

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
    @:native("BaseContext") var baseContext: (p0: go.net.Listener) -> go.context.Context;
    @:native("ConnContext") var connContext: (ctx: go.context.Context, c: go.net.Conn) -> go.context.Context;
    @:native("HTTP2") var HTTP2: go.Pointer<go.net.http.HTTP2Config>;
    @:native("Protocols") var protocols: go.Pointer<go.net.http.Protocols>;

function new(addr: String, handler: go.net.http.Handler, disableGeneralOptionsHandler: Bool, tLSConfig: go.Pointer<go.crypto.tls.Config>, readTimeout: go.time.Duration, readHeaderTimeout: go.time.Duration, writeTimeout: go.time.Duration, idleTimeout: go.time.Duration, maxHeaderBytes: go.GoInt, tLSNextProto: go.Map<String, (p0: go.Pointer<go.net.http.Server>, p1: go.Pointer<go.crypto.tls.Conn>, p2: go.net.http.Handler) -> Void>, connState: (p0: go.net.Conn, p1: go.net.http.ConnState) -> Void, errorLog: go.Pointer<go.log.Logger>, baseContext: (p0: go.net.Listener) -> go.context.Context, connContext: (ctx: go.context.Context, c: go.net.Conn) -> go.context.Context, HTTP2: go.Pointer<go.net.http.HTTP2Config>, protocols: go.Pointer<go.net.http.Protocols>);

    @:native("Close") function close(): go.Error;
    @:native("ListenAndServe") function listenAndServe(): go.Error;
    @:native("ListenAndServeTLS") function listenAndServeTLS(certFile: String, keyFile: String): go.Error;
    @:native("RegisterOnShutdown") function registerOnShutdown(f: () -> Void): Void;
    @:native("Serve") function serve(l: go.net.Listener): go.Error;
    @:native("ServeTLS") function serveTLS(l: go.net.Listener, certFile: String, keyFile: String): go.Error;
    @:native("SetKeepAlivesEnabled") function setKeepAlivesEnabled(v: Bool): Void;
    @:native("Shutdown") function shutdown(ctx: go.context.Context): go.Error;

}