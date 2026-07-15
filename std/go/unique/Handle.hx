package go.unique;

@:structInit
@:go.Type({ name: "Handle", instanceName: "unique.Handle", imports: ["unique"] })
extern class Handle<T: go.Comparable> {

    @:native("Value") function value(): T;

}