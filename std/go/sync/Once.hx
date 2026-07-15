package go.sync;

@:structInit
@:go.Type({ name: "Once", instanceName: "sync.Once", imports: ["sync"] })
extern class Once {

    @:native("Do") function _do(f: () -> Void): Void;

}