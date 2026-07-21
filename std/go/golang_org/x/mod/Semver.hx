package go.golang_org.x.mod;

@:go.Type({ name: "semver", instanceName: "semver.semver", imports: ["golang.org/x/mod/semver"] })
extern class Semver {

    @:native("Build") static function build(v: String): (String);
    @:native("Canonical") static function canonical(v: String): (String);
    @:native("Compare") static function compare(v: String, w: String): (go.GoInt);
    @:native("IsValid") static function isValid(v: String): (Bool);
    @:native("Major") static function major(v: String): (String);
    @:native("MajorMinor") static function majorMinor(v: String): (String);
    @:native("Max") static function max(v: String, w: String): (String);
    @:native("Prerelease") static function prerelease(v: String): (String);
    @:native("Sort") static function sort(list: go.Slice<String>): Void;

}