package go.internal.runtime.gc.internal.gen;

@:structInit
@:go.Type({ name: "Ptr", instanceName: "gen.Ptr", imports: ["internal/runtime/gc/internal/gen"] })
extern class Ptr<T: go.internal.runtime.gc.internal.gen.Value> {

    @:native("AddConst") function addConst(off: go.GoInt): go.internal.runtime.gc.internal.gen.Ptr<T>;
    @:native("String") function string(): String;

}