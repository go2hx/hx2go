package go.internal.runtime.syscall.linux;

@:structInit
@:go.Type({ name: "EpollEvent", instanceName: "linux.EpollEvent", imports: ["internal/runtime/syscall/linux"] })
extern class EpollEvent {

    @:native("Events") var events: go.UInt32;
    @:native("Data") var data: go.GoArray<go.Byte, 8>;

function new(events: go.UInt32, data: go.GoArray<go.Byte, 8>);

}