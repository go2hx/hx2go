package go.encoding.gob;

@:structInit
@:go.Type({ name: "CommonType", instanceName: "gob.CommonType", imports: ["encoding/gob"] })
extern class CommonType {

    @:native("Name") var name: String;
    @:native("Id") var id: go.encoding.gob.typeId;

function new(name: String, id: go.encoding.gob.typeId);

}