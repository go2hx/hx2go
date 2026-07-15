package go.internal.runtime.gc.internal.gen;

@:structInit
@:go.Type({ name: "Array", instanceName: "gen.Array", imports: ["internal/runtime/gc/internal/gen"] })
extern class Array<T: go.internal.runtime.gc.internal.gen.Value> {

    @:native("String") function string(): String;

}