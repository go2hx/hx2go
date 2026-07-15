package go.debug.elf;

@:structInit
@:go.Type({ name: "FormatError", instanceName: "elf.FormatError", imports: ["debug/elf"] })
extern class FormatError {

    @:native("Error") function error(): String;

}