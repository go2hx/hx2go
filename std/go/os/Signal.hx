package go.os;

@:go.Type({ name: "signal", instanceName: "signal.signal", imports: ["os/signal"] })
extern class Signal {

    @:native("Ignore") static function ignore(sig: haxe.Rest<go.os.Signal>): Void;
    @:native("Ignored") static function ignored(sig: go.os.Signal): Bool;
    @:native("Notify") static function notify(c: go.Chan<go.os.Signal>, sig: haxe.Rest<go.os.Signal>): Void;
    @:go.Tuple("ctx", "stop") @:native("NotifyContext") static function notifyContext(parent: go.context.Context, signals: haxe.Rest<go.os.Signal>): go.Tuple<{ ctx: go.context.Context, stop: go.context.CancelFunc }>;
    @:native("Reset") static function reset(sig: haxe.Rest<go.os.Signal>): Void;
    @:native("Stop") static function stop(c: go.Chan<go.os.Signal>): Void;

}