package go.internal;

@:go.Type({ name: "profile", instanceName: "profile.profile", imports: ["internal/profile"] })
extern class Profile {

    @:go.Tuple("p0", "p1") @:native("CreateNodes") static function createNodes(prof: go.Pointer<go.internal.profile.Profile>, o: go.Pointer<go.internal.profile.Options>): go.Tuple<{ p0: go.internal.profile.Nodes, p1: go.internal.profile.locationMap }>;
    @:native("Merge") static function merge(srcs: go.Slice<go.Pointer<go.internal.profile.Profile>>): go.Result<go.Pointer<go.internal.profile.Profile>>;
    @:native("NewGraph") static function newGraph(prof: go.Pointer<go.internal.profile.Profile>, o: go.Pointer<go.internal.profile.Options>): go.Pointer<go.internal.profile.Graph>;
    @:native("Parse") static function parse(r: go.io.Reader): go.Result<go.Pointer<go.internal.profile.Profile>>;

}