package go.encoding.xml;

@:go.Type({ name: "TokenReader", instanceName: "xml.TokenReader", imports: ["encoding/xml"] })
extern typedef TokenReader = {

    @:native("Token") function token(): go.Result<go.encoding.xml.Token>;

}