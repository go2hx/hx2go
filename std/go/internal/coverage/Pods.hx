package go.internal.coverage;

@:go.Type({ name: "pods", instanceName: "pods.pods", imports: ["internal/coverage/pods"] })
extern class Pods {

    @:native("CollectPods") static function collectPods(dirs: go.Slice<String>, warn: Bool): go.Result<go.Slice<go.internal.coverage.pods.Pod>>;
    @:native("CollectPodsFromFiles") static function collectPodsFromFiles(files: go.Slice<String>, warn: Bool): go.Slice<go.internal.coverage.pods.Pod>;

}