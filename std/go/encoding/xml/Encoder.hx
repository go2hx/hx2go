package go.encoding.xml;

@:structInit
@:go.Type({ name: "Encoder", instanceName: "xml.Encoder", imports: ["encoding/xml"] })
extern class Encoder {

    @:native("Close") function close(): go.Error;
    @:native("Encode") function encode(v: Dynamic): go.Error;
    @:native("EncodeElement") function encodeElement(v: Dynamic, start: go.encoding.xml.StartElement): go.Error;
    @:native("EncodeToken") function encodeToken(t: go.encoding.xml.Token): go.Error;
    @:native("Flush") function flush(): go.Error;
    @:native("Indent") function indent(prefix: String, indent: String): Void;

}