package go.debug.gosym;

@:structInit
@:go.Type({ name: "DecodingError", instanceName: "gosym.DecodingError", imports: ["debug/gosym"] })
extern class DecodingError {

    @:native("Error") function error(): String;

}