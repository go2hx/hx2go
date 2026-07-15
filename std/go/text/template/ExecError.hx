package go.text.template;

@:structInit
@:go.Type({ name: "ExecError", instanceName: "template.ExecError", imports: ["text/template"] })
extern class ExecError {

    @:native("Name") var name: String;
    @:native("Err") var err: go.Error;

function new(name: String, err: go.Error);

    @:native("Error") function error(): String;
    @:native("Unwrap") function unwrap(): go.Error;

}