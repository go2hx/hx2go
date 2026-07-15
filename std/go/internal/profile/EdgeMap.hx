package go.internal.profile;

@:go.Type({ name: "EdgeMap", instanceName: "profile.EdgeMap", imports: ["internal/profile"] })
extern class EdgeMap {

    @:native("Add") function add(e: go.Pointer<go.internal.profile.Edge>): Void;
    @:native("Delete") function delete(e: go.Pointer<go.internal.profile.Edge>): Void;
    @:native("FindTo") function findTo(n: go.Pointer<go.internal.profile.Node>): go.Pointer<go.internal.profile.Edge>;
    @:native("Sort") function sort(): go.Slice<go.Pointer<go.internal.profile.Edge>>;
    @:native("Sum") function sum(): go.Int64;

}