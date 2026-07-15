package go.encoding.xml;

@:go.Type({ name: "MarshalerAttr", instanceName: "xml.MarshalerAttr", imports: ["encoding/xml"] })
extern typedef MarshalerAttr = {

    @:native("MarshalXMLAttr") function marshalXMLAttr(name: go.encoding.xml.Name): go.Result<go.encoding.xml.Attr>;

}