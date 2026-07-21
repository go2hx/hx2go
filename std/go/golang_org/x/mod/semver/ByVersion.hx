package go.golang_org.x.mod.semver;

@:go.Type({ name: "ByVersion", instanceName: "semver.ByVersion", imports: ["golang.org/x/mod/semver"] })
extern class ByVersion {

    @:native("Len") function len(): (go.GoInt);
    @:native("Less") function less(i: go.GoInt, j: go.GoInt): (Bool);
    @:native("Swap") function swap(i: go.GoInt, j: go.GoInt): Void;

}