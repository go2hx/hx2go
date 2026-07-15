package go.internal.testenv;

@:structInit
@:go.Type({ name: "SpecialBuildTypes", instanceName: "testenv.SpecialBuildTypes", imports: ["internal/testenv"] })
extern class SpecialBuildTypes {

    @:native("Cgo") var cgo: Bool;
    @:native("Asan") var asan: Bool;
    @:native("Msan") var msan: Bool;
    @:native("Race") var race: Bool;

function new(cgo: Bool, asan: Bool, msan: Bool, race: Bool);

}