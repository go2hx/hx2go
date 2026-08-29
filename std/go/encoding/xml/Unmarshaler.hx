package go.encoding.xml;

/**
    Unmarshaler is the interface implemented by objects that can unmarshal
    an XML element description of themselves.
    
    UnmarshalXML decodes a single XML element
    beginning with the given start element.
    If it returns an error, the outer call to Unmarshal stops and
    returns that error.
    UnmarshalXML must consume exactly one XML element.
    One common implementation strategy is to unmarshal into
    a separate value with a layout matching the expected XML
    using d.DecodeElement, and then to copy the data from
    that value into the receiver.
    Another common strategy is to use d.Token to process the
    XML object one token at a time.
    UnmarshalXML may not use d.RawToken.
**/
@:go.Type({ name: "Unmarshaler", instanceName: "xml.Unmarshaler", imports: ["encoding/xml"] })
extern typedef Unmarshaler = {

    @:native("UnmarshalXML") function unmarshalXML(d: go.Pointer<go.encoding.xml.Decoder>, start: go.encoding.xml.StartElement): (go.Error);

}