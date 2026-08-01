package go.unique;

@:structInit
@:go.Type({ name: "uniqueMap", instanceName: "unique.uniqueMap", imports: ["unique"] })
extern class UniqueMap<T: go.Comparable> {

    @:native("Load") function load(key: T): (go.Pointer<T>);
    @:native("LoadOrStore") function loadOrStore(key: T): (go.Pointer<T>);

}