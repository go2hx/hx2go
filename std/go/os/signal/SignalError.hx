package go.os.signal;

@:go.Type({ name: "signalError", instanceName: "signal.signalError", imports: ["os/signal"] })
extern typedef SignalError = haxe.extern.EitherType<String, {
    @:native("Error") function error(): (String);
    @:native("Is") function _is(target: go.Error): (Bool);

}>