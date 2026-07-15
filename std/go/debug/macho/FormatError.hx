package go.debug.macho;

@:structInit
@:go.Type({ name: "FormatError", instanceName: "macho.FormatError", imports: ["debug/macho"] })
extern class FormatError {

    @:native("Error") function error(): String;

}