package go.encoding.gob;

@:structInit
@:go.Type({ name: "gobEncoderType", instanceName: "gob.gobEncoderType", imports: ["encoding/gob"] })
extern class GobEncoderType {

    @:native("CommonType") var commonType: go.encoding.gob.CommonType;
    @:native("Name") var name: String;
    @:native("Id") var id: go.encoding.gob.TypeId;

    function new(commonType: go.encoding.gob.CommonType);

}