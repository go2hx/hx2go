package go.encoding.xml;

@:go.Type({ name: "Marshaler", instanceName: "xml.Marshaler", imports: ["encoding/xml"] })
extern typedef Marshaler = {

    @:native("MarshalXML") function marshalXML(e: go.Pointer<go.encoding.xml.Encoder>, start: go.encoding.xml.StartElement): go.Error;

}