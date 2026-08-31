package go.encoding.gob;

@:structInit
@:go.Type({ name: "mapType", instanceName: "gob.mapType", imports: ["encoding/gob"] })
extern class MapType {

    @:native("CommonType") var commonType: go.encoding.gob.CommonType;
    @:native("Key") var key: go.encoding.gob.TypeId;
    @:native("Elem") var elem: go.encoding.gob.TypeId;
    @:native("Name") var name: String;
    @:native("Id") var id: go.encoding.gob.TypeId;

    function new(commonType: go.encoding.gob.CommonType, key: go.encoding.gob.TypeId=cast 0, elem: go.encoding.gob.TypeId=cast 0);

}