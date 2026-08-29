package go.encoding.gob;

@:structInit
@:go.Type({ name: "structType", instanceName: "gob.structType", imports: ["encoding/gob"] })
extern class StructType {

    @:native("CommonType") var commonType: go.encoding.gob.CommonType;
    @:native("Field") var field: go.Slice<go.encoding.gob.FieldType>;
    @:native("Name") var name: String;
    @:native("Id") var id: go.encoding.gob.TypeId;

    function new(commonType: go.encoding.gob.CommonType, field: go.Slice<go.encoding.gob.FieldType>=null);

}