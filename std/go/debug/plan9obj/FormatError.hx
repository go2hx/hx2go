package go.debug.plan9obj;

@:structInit
@:go.Type({ name: "formatError", instanceName: "plan9obj.formatError", imports: ["debug/plan9obj"] })
extern class FormatError {

    @:native("Error") function error(): (String);

}