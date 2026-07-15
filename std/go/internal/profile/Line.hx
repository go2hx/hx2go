package go.internal.profile;

@:structInit
@:go.Type({ name: "Line", instanceName: "profile.Line", imports: ["internal/profile"] })
extern class Line {

    @:native("Function") var _function: go.Pointer<go.internal.profile.Function>;
    @:native("Line") var line: go.Int64;

function new(_function: go.Pointer<go.internal.profile.Function>, line: go.Int64);

}