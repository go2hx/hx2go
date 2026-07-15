package go.internal.coverage.pods;

@:structInit
@:go.Type({ name: "Pod", instanceName: "pods.Pod", imports: ["internal/coverage/pods"] })
extern class Pod {

    @:native("MetaFile") var metaFile: String;
    @:native("CounterDataFiles") var counterDataFiles: go.Slice<String>;
    @:native("Origins") var origins: go.Slice<go.GoInt>;
    @:native("ProcessIDs") var processIDs: go.Slice<go.GoInt>;

function new(metaFile: String, counterDataFiles: go.Slice<String>, origins: go.Slice<go.GoInt>, processIDs: go.Slice<go.GoInt>);

}