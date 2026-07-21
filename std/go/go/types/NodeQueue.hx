package go.go.types;

@:go.Type({ name: "nodeQueue", instanceName: "types.nodeQueue", imports: ["go/types"] })
extern class NodeQueue {

    @:native("Len") function len(): (go.GoInt);
    @:native("Less") function less(i: go.GoInt, j: go.GoInt): (Bool);
    @:native("Pop") function pop(): (Dynamic);
    @:native("Push") function push(x: Dynamic): Void;
    @:native("Swap") function swap(i: go.GoInt, j: go.GoInt): Void;

}