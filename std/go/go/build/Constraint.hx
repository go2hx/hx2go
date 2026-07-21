package go.go.build;

@:go.Type({ name: "constraint", instanceName: "constraint.constraint", imports: ["go/build/constraint"] })
extern class Constraint {

    @:native("GoVersion") static function goVersion(x: go.go.build.constraint.Expr): (String);
    @:native("IsGoBuild") static function isGoBuild(line: String): (Bool);
    @:native("IsPlusBuild") static function isPlusBuild(line: String): (Bool);
    @:native("Parse") static function parse(line: String): (go.Result<go.go.build.constraint.Expr>);
    @:native("PlusBuildLines") static function plusBuildLines(x: go.go.build.constraint.Expr): (go.Result<go.Slice<String>>);

}