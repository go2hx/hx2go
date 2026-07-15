package go.encoding.xml;

@:structInit
@:go.Type({ name: "Name", instanceName: "xml.Name", imports: ["encoding/xml"] })
extern class Name {

    @:native("Space") var space: String;
    @:native("Local") var local: String;

function new(space: String, local: String);

}