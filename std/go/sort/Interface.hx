package go.sort;

@:go.Type({ name: "Interface", instanceName: "sort.Interface", imports: ["sort"] })
extern typedef Interface = {

    @:native("Len") function len(): (go.GoInt);
    @:native("Less") function less(i: go.GoInt, j: go.GoInt): (Bool);
    @:native("Swap") function swap(i: go.GoInt, j: go.GoInt): Void;

}