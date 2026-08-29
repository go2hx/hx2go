package go.encoding.xml;

/**
    MarshalerAttr is the interface implemented by objects that can marshal
    themselves into valid XML attributes.
    
    MarshalXMLAttr returns an XML attribute with the encoded value of the receiver.
    Using name as the attribute name is not required, but doing so
    will enable [Unmarshal] to match the attribute to the correct
    struct field.
    If MarshalXMLAttr returns the zero attribute [Attr]{}, no attribute
    will be generated in the output.
    MarshalXMLAttr is used only for struct fields with the
    "attr" option in the field tag.
**/
@:go.Type({ name: "MarshalerAttr", instanceName: "xml.MarshalerAttr", imports: ["encoding/xml"] })
extern typedef MarshalerAttr = {

    @:native("MarshalXMLAttr") function marshalXMLAttr(name: go.encoding.xml.Name): (go.Result<go.encoding.xml.Attr>);

}