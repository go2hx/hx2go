package go.encoding.gob;

@:structInit
@:go.Type({ name: "arrayType", instanceName: "gob.arrayType", imports: ["encoding/gob"] })
extern class ArrayType {

    @:native("CommonType") var commonType: go.encoding.gob.CommonType;
    @:native("Elem") var elem: go.encoding.gob.TypeId;
    @:native("Len") var len: go.GoInt;
    @:native("Name") var name: String;
    @:native("Id") var id: go.encoding.gob.TypeId;

    function new(commonType: go.encoding.gob.CommonType, elem: go.encoding.gob.TypeId=cast 0, len: go.GoInt=0);

}