package go.encoding.xml;

@:go.Type({ name: "UnmarshalerAttr", instanceName: "xml.UnmarshalerAttr", imports: ["encoding/xml"] })
extern typedef UnmarshalerAttr = {

    @:native("UnmarshalXMLAttr") function unmarshalXMLAttr(attr: go.encoding.xml.Attr): go.Error;

}