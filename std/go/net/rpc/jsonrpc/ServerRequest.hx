package go.net.rpc.jsonrpc;

@:structInit
@:go.Type({ name: "serverRequest", instanceName: "jsonrpc.serverRequest", imports: ["net/rpc/jsonrpc"] })
extern class ServerRequest {

    @:native("Method") var method: String;
    @:native("Params") var params: go.Pointer<go.encoding.json.RawMessage>;
    @:native("Id") var id: go.Pointer<go.encoding.json.RawMessage>;

    function new(method: String="", params: go.Pointer<go.encoding.json.RawMessage>=null, id: go.Pointer<go.encoding.json.RawMessage>=null);

}