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

    function new(cmd: go.debug.macho.LoadCmd=cast 0, len: go.UInt32=0, name: go.UInt32=0, time: go.UInt32=0, currentVersion: go.UInt32=0, compatVersion: go.UInt32=0);

}