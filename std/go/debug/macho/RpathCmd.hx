package go.debug.macho;

@:structInit
@:go.Type({ name: "RpathCmd", instanceName: "macho.RpathCmd", imports: ["debug/macho"] })
extern class RpathCmd {

    @:native("Cmd") var cmd: go.debug.macho.LoadCmd;
    @:native("Len") var len: go.UInt32;
    @:native("Path") var path: go.UInt32;

function new(cmd: go.debug.macho.LoadCmd, len: go.UInt32, path: go.UInt32);

}