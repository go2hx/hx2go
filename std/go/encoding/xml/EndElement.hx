package go.encoding.xml;

/**
    An EndElement represents an XML end element.
**/
@:structInit
@:go.Type({ name: "EndElement", instanceName: "xml.EndElement", imports: ["encoding/xml"] })
extern class EndElement {

    @:native("Name") var name: go.encoding.xml.Name;

    function new(name: go.encoding.xml.Name);

}