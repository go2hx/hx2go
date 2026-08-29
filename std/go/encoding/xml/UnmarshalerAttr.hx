package go.encoding.xml;

/**
    UnmarshalerAttr is the interface implemented by objects that can unmarshal
    an XML attribute description of themselves.
    
    UnmarshalXMLAttr decodes a single XML attribute.
    If it returns an error, the outer call to [Unmarshal] stops and
    returns that error.
    UnmarshalXMLAttr is used only for struct fields with the
    "attr" option in the field tag.
**/
@:go.Type({ name: "UnmarshalerAttr", instanceName: "xml.UnmarshalerAttr", imports: ["encoding/xml"] })
extern typedef UnmarshalerAttr = {

    @:native("UnmarshalXMLAttr") function unmarshalXMLAttr(attr: go.encoding.xml.Attr): (go.Error);

}