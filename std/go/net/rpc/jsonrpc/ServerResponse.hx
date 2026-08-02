package go.net.rpc.jsonrpc;

@:structInit
@:go.Type({ name: "serverResponse", instanceName: "jsonrpc.serverResponse", imports: ["net/rpc/jsonrpc"] })
extern class ServerResponse {

    @:native("Id") var id: go.Pointer<go.encoding.json.RawMessage>;
    @:native("Result") var result: Dynamic;
    @:native("Error") var error: Dynamic;

    function new(id: go.Pointer<go.encoding.json.RawMessage>, result: Dynamic, error: Dynamic);

}