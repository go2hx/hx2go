package go;

@:go.Type({ name: "context", instanceName: "context.context", imports: ["context"] })
extern class Context {

    @:native("AfterFunc") static function afterFunc(ctx: go.context.Context, f: () -> Void): (() -> (Bool));
    @:native("Background") static function background(): (go.context.Context);
    @:native("Cause") static function cause(c: go.context.Context): (go.Error);
    @:native("TODO") static function TODO(): (go.context.Context);
    @:go.Tuple("ctx", "cancel") @:native("WithCancel") static function withCancel(parent: go.context.Context): (go.Tuple<{ ctx: go.context.Context, cancel: go.context.CancelFunc }>);
    @:go.Tuple("ctx", "cancel") @:native("WithCancelCause") static function withCancelCause(parent: go.context.Context): (go.Tuple<{ ctx: go.context.Context, cancel: go.context.CancelCauseFunc }>);
    @:go.Tuple("p0", "p1") @:native("WithDeadline") static function withDeadline(parent: go.context.Context, d: go.time.Time): (go.Tuple<{ p0: go.context.Context, p1: go.context.CancelFunc }>);
    @:go.Tuple("p0", "p1") @:native("WithDeadlineCause") static function withDeadlineCause(parent: go.context.Context, d: go.time.Time, cause: go.Error): (go.Tuple<{ p0: go.context.Context, p1: go.context.CancelFunc }>);
    @:go.Tuple("p0", "p1") @:native("WithTimeout") static function withTimeout(parent: go.context.Context, timeout: go.time.Duration): (go.Tuple<{ p0: go.context.Context, p1: go.context.CancelFunc }>);
    @:go.Tuple("p0", "p1") @:native("WithTimeoutCause") static function withTimeoutCause(parent: go.context.Context, timeout: go.time.Duration, cause: go.Error): (go.Tuple<{ p0: go.context.Context, p1: go.context.CancelFunc }>);
    @:native("WithValue") static function withValue(parent: go.context.Context, key: Dynamic, val: Dynamic): (go.context.Context);
    @:native("WithoutCancel") static function withoutCancel(parent: go.context.Context): (go.context.Context);

}