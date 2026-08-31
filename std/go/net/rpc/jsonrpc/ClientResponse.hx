package go.net.rpc.jsonrpc;

@:structInit
@:go.Type({ name: "clientResponse", instanceName: "jsonrpc.clientResponse", imports: ["net/rpc/jsonrpc"] })
extern class ClientResponse {

    @:native("Id") var id: go.UInt64;
    @:native("Result") var result: go.Pointer<go.encoding.json.RawMessage>;
    @:native("Error") var error: Dynamic;

    function new(id: go.UInt64=0, result: go.Pointer<go.encoding.json.RawMessage>=null, error: Dynamic=null);

}