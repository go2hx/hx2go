package go.encoding.xml;

/**
    Marshaler is the interface implemented by objects that can marshal
    themselves into valid XML elements.
    
    MarshalXML encodes the receiver as zero or more XML elements.
    By convention, arrays or slices are typically encoded as a sequence
    of elements, one per entry.
    Using start as the element tag is not required, but doing so
    will enable [Unmarshal] to match the XML elements to the correct
    struct field.
    One common implementation strategy is to construct a separate
    value with a layout corresponding to the desired XML and then
    to encode it using e.EncodeElement.
    Another common strategy is to use repeated calls to e.EncodeToken
    to generate the XML output one token at a time.
    The sequence of encoded tokens must make up zero or more valid
    XML elements.
**/
@:go.Type({ name: "Marshaler", instanceName: "xml.Marshaler", imports: ["encoding/xml"] })
extern typedef Marshaler = {

    @:native("MarshalXML") function marshalXML(e: go.Pointer<go.encoding.xml.Encoder>, start: go.encoding.xml.StartElement): (go.Error);

}