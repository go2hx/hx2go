package go.debug.macho;

@:structInit
@:go.Type({ name: "DylibCmd", instanceName: "macho.DylibCmd", imports: ["debug/macho"] })
extern class DylibCmd {

    @:native("Cmd") var cmd: go.debug.macho.LoadCmd;
    @:native("Len") var len: go.UInt32;
    @:native("Name") var name: go.UInt32;
    @:native("Time") var time: go.UInt32;
    @:native("CurrentVersion") var currentVersion: go.UInt32;
    @:native("CompatVersion") var compatVersion: go.UInt32;

function new(cmd: go.debug.macho.LoadCmd, len: go.UInt32, name: go.UInt32, time: go.UInt32, currentVersion: go.UInt32, compatVersion: go.UInt32);

}