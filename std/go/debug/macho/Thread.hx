package go.debug.macho;

/**
    A Thread is a Mach-O thread state command.
**/
@:structInit
@:go.Type({ name: "Thread", instanceName: "macho.Thread", imports: ["debug/macho"] })
extern class Thread {

    @:native("Cmd") var cmd: go.debug.macho.LoadCmd;
    @:native("Len") var len: go.UInt32;
    @:native("Type") var type: go.UInt32;
    @:native("Data") var data: go.Slice<go.UInt32>;

    function new(cmd: go.debug.macho.LoadCmd=cast 0, len: go.UInt32=0, type: go.UInt32=0, data: go.Slice<go.UInt32>=null);

}