package go.encoding.gob;

/**
    CommonType holds elements of all types.
    It is a historical artifact, kept for binary compatibility and exported
    only for the benefit of the package's encoding of type descriptors. It is
    not intended for direct use by clients.
**/
@:structInit
@:go.Type({ name: "CommonType", instanceName: "gob.CommonType", imports: ["encoding/gob"] })
extern class CommonType {

    @:native("Name") var name: String;
    @:native("Id") var id: go.encoding.gob.TypeId;

    function new(name: String="", id: go.encoding.gob.TypeId=cast 0);

}