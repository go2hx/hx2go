package go.encoding.xml;

@:go.Type({ name: "Unmarshaler", instanceName: "xml.Unmarshaler", imports: ["encoding/xml"] })
extern typedef Unmarshaler = {

    @:native("UnmarshalXML") function unmarshalXML(d: go.Pointer<go.encoding.xml.Decoder>, start: go.encoding.xml.StartElement): go.Error;

}