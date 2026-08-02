package go.net.rpc;

@:go.Type({ name: "methodArray", instanceName: "rpc.methodArray", imports: ["net/rpc"] })
extern class MethodArray {

    @:native("Len") function len(): (go.GoInt);
    @:native("Less") function less(i: go.GoInt, j: go.GoInt): (Bool);
    @:native("Swap") function swap(i: go.GoInt, j: go.GoInt): Void;

}