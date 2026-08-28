package go.text.template;

/**
    ExecError is the custom error type returned when Execute has an
    error evaluating its template. (If a write error occurs, the actual
    error is returned; it will not be of type ExecError.)
**/
@:structInit
@:go.Type({ name: "ExecError", instanceName: "template.ExecError", imports: ["text/template"] })
extern class ExecError {

    @:native("Name") var name: String;
    @:native("Err") var err: go.Error;

    function new(name: String="", err: go.Error=null);

    @:native("Error") function error(): (String);
    @:native("Unwrap") function unwrap(): (go.Error);

}