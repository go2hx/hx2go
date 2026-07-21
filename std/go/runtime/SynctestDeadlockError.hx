package go.runtime;

@:structInit
@:go.Type({ name: "synctestDeadlockError", instanceName: "runtime.synctestDeadlockError", imports: ["runtime"] })
extern class SynctestDeadlockError {

    @:native("Error") function error(): (String);

}