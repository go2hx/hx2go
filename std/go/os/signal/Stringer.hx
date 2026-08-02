package go.os.signal;

@:go.Type({ name: "stringer", instanceName: "signal.stringer", imports: ["os/signal"] })
extern typedef Stringer = {

    @:native("String") function string(): (String);

}