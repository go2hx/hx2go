package go;

@:go.Type({ name: "errors", instanceName: "errors.errors", imports: ["errors"] })
extern class Errors {

    @:native("As") static function as(err: go.Error, target: Dynamic): (Bool);
    @:go.Tuple("p0", "p1") @:native("AsType") static function asType<E: go.Error>(err: go.Error): (go.Tuple<{ p0: E, p1: Bool }>);
    @:native("Is") static function _is(err: go.Error, target: go.Error): (Bool);
    @:native("Join") static function join(errs: haxe.Rest<go.Error>): (go.Error);
    @:native("New") static function _new(text: String): (go.Error);
    @:native("Unwrap") static function unwrap(err: go.Error): (go.Error);

}