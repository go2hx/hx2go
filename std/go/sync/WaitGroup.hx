package go.sync;

@:structInit
@:go.Type({ name: "WaitGroup", instanceName: "sync.WaitGroup", imports: ["sync"] })
extern class WaitGroup {

    @:native("Add") function add(delta: go.GoInt): Void;
    @:native("Done") function done(): Void;
    @:native("Go") function go(f: () -> Void): Void;
    @:native("Wait") function wait(): Void;

}