package go.container.heap;

@:go.Type({ name: "Interface", instanceName: "heap.Interface", imports: ["container/heap"] })
extern typedef Interface = {

    @:native("Len") function len(): (go.GoInt);
    @:native("Less") function less(i: go.GoInt, j: go.GoInt): (Bool);
    @:native("Pop") function pop(): (Dynamic);
    @:native("Push") function push(x: Dynamic): Void;
    @:native("Swap") function swap(i: go.GoInt, j: go.GoInt): Void;

}