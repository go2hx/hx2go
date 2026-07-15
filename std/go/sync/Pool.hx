package go.sync;

@:structInit
@:go.Type({ name: "Pool", instanceName: "sync.Pool", imports: ["sync"] })
extern class Pool {

    @:native("New") var _new: () -> Dynamic;

function new(_new: () -> Dynamic);

    @:native("Get") function get(): Dynamic;
    @:native("Put") function put(x: Dynamic): Void;

}