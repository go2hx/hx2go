package go.golang_org.x.sync.errgroup;

@:structInit
@:go.Type({ name: "Group", instanceName: "errgroup.Group", imports: ["golang.org/x/sync/errgroup"] })
extern class Group {

    @:native("Go") function go(f: () -> (go.Error)): Void;
    @:native("SetLimit") function setLimit(n: go.GoInt): Void;
    @:native("TryGo") function tryGo(f: () -> (go.Error)): (Bool);
    @:native("Wait") function wait(): (go.Error);

}