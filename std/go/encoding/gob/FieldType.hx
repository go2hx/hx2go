package go.encoding.gob;

@:structInit
@:go.Type({ name: "fieldType", instanceName: "gob.fieldType", imports: ["encoding/gob"] })
extern class FieldType {

    @:native("Name") var name: String;
    @:native("Id") var id: go.encoding.gob.TypeId;

    function new(name: String="", id: go.encoding.gob.TypeId=cast 0);

}