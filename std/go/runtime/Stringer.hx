package go.runtime;

@:go.Type({ name: "stringer", instanceName: "runtime.stringer", imports: ["runtime"] })
extern typedef Stringer = {

    @:native("String") function string(): (String);

}