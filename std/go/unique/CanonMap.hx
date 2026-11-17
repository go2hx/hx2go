package go.unique;

@:structInit
@:go.Type({ name: "canonMap", instanceName: "unique.canonMap", imports: ["unique"] })
extern class CanonMap<T> {

    @:native("Load") function load(key: T): (go.Pointer<T>);
    @:native("LoadOrStore") function loadOrStore(key: T): (go.Pointer<T>);

}