package go.net.textproto;

@:structInit
@:go.Type({ name: "Pipeline", instanceName: "textproto.Pipeline", imports: ["net/textproto"] })
extern class Pipeline {

    @:native("EndRequest") function endRequest(id: go.GoUInt): Void;
    @:native("EndResponse") function endResponse(id: go.GoUInt): Void;
    @:native("Next") function next(): go.GoUInt;
    @:native("StartRequest") function startRequest(id: go.GoUInt): Void;
    @:native("StartResponse") function startResponse(id: go.GoUInt): Void;

}