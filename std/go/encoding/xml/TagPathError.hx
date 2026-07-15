package go.encoding.xml;

@:structInit
@:go.Type({ name: "TagPathError", instanceName: "xml.TagPathError", imports: ["encoding/xml"] })
extern class TagPathError {

    @:native("Struct") var struct: go.reflect.Type;
    @:native("Field1") var field1: String;
    @:native("Tag1") var tag1: String;
    @:native("Field2") var field2: String;
    @:native("Tag2") var tag2: String;

function new(struct: go.reflect.Type, field1: String, tag1: String, field2: String, tag2: String);

    @:native("Error") function error(): String;

}