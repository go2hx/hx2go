package go.debug.macho;

/**
    A LoadBytes is the uninterpreted bytes of a Mach-O load command.
**/
@:go.Type({ name: "LoadBytes", instanceName: "macho.LoadBytes", imports: ["debug/macho"] })
extern class LoadBytes {

    @:native("Raw") function raw(): (go.Slice<go.Byte>);

}