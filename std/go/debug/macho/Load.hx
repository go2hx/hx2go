package go.debug.macho;

/**
    A Load represents any Mach-O load command.
**/
@:go.Type({ name: "Load", instanceName: "macho.Load", imports: ["debug/macho"] })
extern typedef Load = {

    @:native("Raw") function raw(): (go.Slice<go.Byte>);

}