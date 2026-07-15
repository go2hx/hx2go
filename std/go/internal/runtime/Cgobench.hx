package go.internal.runtime;

@:go.Type({ name: "cgobench", instanceName: "cgobench.cgobench", imports: ["internal/runtime/cgobench"] })
extern class Cgobench {

    @:native("CallbackC") static function callbackC(): Void;
    @:native("Empty") static function empty(): Void;
    @:native("EmptyC") static function emptyC(): Void;

}