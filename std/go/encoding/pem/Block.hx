package go.encoding.pem;

@:structInit
@:go.Type({ name: "Block", instanceName: "pem.Block", imports: ["encoding/pem"] })
extern class Block {

    @:native("Type") var type: String;
    @:native("Headers") var headers: go.Map<String, String>;
    @:native("Bytes") var bytes: go.Slice<go.Byte>;

function new(type: String, headers: go.Map<String, String>, bytes: go.Slice<go.Byte>);

}