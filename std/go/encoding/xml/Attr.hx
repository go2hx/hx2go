package go.encoding.xml;

@:structInit
@:go.Type({ name: "Attr", instanceName: "xml.Attr", imports: ["encoding/xml"] })
extern class Attr {

    @:native("Name") var name: go.encoding.xml.Name;
    @:native("Value") var value: String;

function new(name: go.encoding.xml.Name, value: String);

}