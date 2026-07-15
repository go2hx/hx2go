package go.internal.runtime.exithook;

@:structInit
@:go.Type({ name: "Hook", instanceName: "exithook.Hook", imports: ["internal/runtime/exithook"] })
extern class Hook {

    @:native("F") var F: () -> Void;
    @:native("RunOnFailure") var runOnFailure: Bool;

function new(F: () -> Void, runOnFailure: Bool);

}