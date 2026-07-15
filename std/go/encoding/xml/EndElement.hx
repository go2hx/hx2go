package go.encoding.xml;

@:structInit
@:go.Type({ name: "EndElement", instanceName: "xml.EndElement", imports: ["encoding/xml"] })
extern class EndElement {

    @:native("Name") var name: go.encoding.xml.Name;

function new(name: go.encoding.xml.Name);

}