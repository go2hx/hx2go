package go.internal.coverage;

@:go.Type({ name: "cformat", instanceName: "cformat.cformat", imports: ["internal/coverage/cformat"] })
extern class Cformat {

    @:native("NewFormatter") static function newFormatter(cm: go.internal.coverage.CounterMode): go.Pointer<go.internal.coverage.cformat.Formatter>;

}