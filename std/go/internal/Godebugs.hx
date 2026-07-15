package go.internal;

@:go.Type({ name: "godebugs", instanceName: "godebugs.godebugs", imports: ["internal/godebugs"] })
extern class Godebugs {

    @:native("All") static var All: go.Slice<go.internal.godebugs.Info>;
    @:native("Removed") static var Removed: go.Slice<go.internal.godebugs.RemovedInfo>;

    @:native("Lookup") static function lookup(name: String): go.Pointer<go.internal.godebugs.Info>;

}