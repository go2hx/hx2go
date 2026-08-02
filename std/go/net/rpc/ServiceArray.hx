package go.net.rpc;

@:go.Type({ name: "serviceArray", instanceName: "rpc.serviceArray", imports: ["net/rpc"] })
extern class ServiceArray {

    @:native("Len") function len(): (go.GoInt);
    @:native("Less") function less(i: go.GoInt, j: go.GoInt): (Bool);
    @:native("Swap") function swap(i: go.GoInt, j: go.GoInt): Void;

}