package go.net.rpc.jsonrpc;

@:structInit
@:go.Type({ name: "clientRequest", instanceName: "jsonrpc.clientRequest", imports: ["net/rpc/jsonrpc"] })
extern class ClientRequest {

    @:native("Method") var method: String;
    @:native("Params") var params: go.GoArray<Dynamic, 1>;
    @:native("Id") var id: go.UInt64;

    function new(method: String="", params: go.GoArray<Dynamic, 1>, id: go.UInt64=0);

}