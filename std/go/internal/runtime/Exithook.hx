package go.internal.runtime;

@:go.Type({ name: "exithook", instanceName: "exithook.exithook", imports: ["internal/runtime/exithook"] })
extern class Exithook {

    @:native("Goid") static var Goid: () -> go.UInt64;
    @:native("Gosched") static var Gosched: () -> Void;
    @:native("Throw") static var Throw: (p0: String) -> Void;

    @:native("Add") static function add(h: go.internal.runtime.exithook.Hook): Void;
    @:native("Run") static function run(code: go.GoInt): Void;

}