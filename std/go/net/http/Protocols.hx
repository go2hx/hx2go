package go.net.http;

@:structInit
@:go.Type({ name: "Protocols", instanceName: "http.Protocols", imports: ["net/http"] })
extern class Protocols {

    @:native("HTTP1") function HTTP1(): Bool;
    @:native("HTTP2") function HTTP2(): Bool;
    @:native("SetHTTP1") function setHTTP1(ok: Bool): Void;
    @:native("SetHTTP2") function setHTTP2(ok: Bool): Void;
    @:native("SetUnencryptedHTTP2") function setUnencryptedHTTP2(ok: Bool): Void;
    @:native("String") function string(): String;
    @:native("UnencryptedHTTP2") function unencryptedHTTP2(): Bool;

}