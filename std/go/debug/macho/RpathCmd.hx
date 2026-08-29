package go.debug.macho;

/**
    A RpathCmd is a Mach-O rpath command.
**/
@:structInit
@:go.Type({ name: "RpathCmd", instanceName: "macho.RpathCmd", imports: ["debug/macho"] })
extern class RpathCmd {

    @:native("Cmd") var cmd: go.debug.macho.LoadCmd;
    @:native("Len") var len: go.UInt32;
    @:native("Path") var path: go.UInt32;

    function new(cmd: go.debug.macho.LoadCmd=cast 0, len: go.UInt32=0, path: go.UInt32=0);

}