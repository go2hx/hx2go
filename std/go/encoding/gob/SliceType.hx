package go.encoding.gob;

@:structInit
@:go.Type({ name: "sliceType", instanceName: "gob.sliceType", imports: ["encoding/gob"] })
extern class SliceType {

    @:native("CommonType") var commonType: go.encoding.gob.CommonType;
    @:native("Elem") var elem: go.encoding.gob.TypeId;
    @:native("Name") var name: String;
    @:native("Id") var id: go.encoding.gob.TypeId;

    function new(commonType: go.encoding.gob.CommonType, elem: go.encoding.gob.TypeId=cast 0);

}