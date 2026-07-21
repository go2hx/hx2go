package go.errors;

@:structInit
@:go.Type({ name: "errorString", instanceName: "errors.errorString", imports: ["errors"] })
extern class ErrorString {

    @:native("Error") function error(): (String);

}