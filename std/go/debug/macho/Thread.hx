package go.debug.macho;

@:structInit
@:go.Type({ name: "Thread", instanceName: "macho.Thread", imports: ["debug/macho"] })
extern class Thread {

    @:native("Cmd") var cmd: go.debug.macho.LoadCmd;
    @:native("Len") var len: go.UInt32;
    @:native("Type") var type: go.UInt32;
    @:native("Data") var data: go.Slice<go.UInt32>;

function new(cmd: go.debug.macho.LoadCmd, len: go.UInt32, type: go.UInt32, data: go.Slice<go.UInt32>);

}