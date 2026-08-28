package go.debug.macho;

/**
    FormatError is returned by some operations if the data does
    not have the correct format for an object file.
**/
@:structInit
@:go.Type({ name: "FormatError", instanceName: "macho.FormatError", imports: ["debug/macho"] })
extern class FormatError {

    @:native("Error") function error(): (String);

}