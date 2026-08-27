package go.net.http.fcgi;

@:structInit
@:go.Type({ name: "header", instanceName: "fcgi.header", imports: ["net/http/fcgi"] })
extern class Header {

    @:native("Version") var version: go.UInt8;
    @:native("Type") var type: go.net.http.fcgi.RecType;
    @:native("Id") var id: go.UInt16;
    @:native("ContentLength") var contentLength: go.UInt16;
    @:native("PaddingLength") var paddingLength: go.UInt8;
    @:native("Reserved") var reserved: go.UInt8;

    function new(version: go.UInt8=0, type: go.net.http.fcgi.RecType=cast 0, id: go.UInt16=0, contentLength: go.UInt16=0, paddingLength: go.UInt8=0, reserved: go.UInt8=0);

}