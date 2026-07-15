package go.internal.runtime.gc.internal.gen;

@:structInit
@:go.Type({ name: "File", instanceName: "gen.File", imports: ["internal/runtime/gc/internal/gen"] })
extern class File {

    @:native("AddConst") function addConst(name: String, data: Dynamic): Void;
    @:native("AddFunc") function addFunc(fn: go.Pointer<go.internal.runtime.gc.internal.gen.Func>): Void;
    @:native("Compile") function compile(): Void;

}