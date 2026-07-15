package go.debug.macho;

@:structInit
@:go.Type({ name: "Dylib", instanceName: "macho.Dylib", imports: ["debug/macho"] })
extern class Dylib {

    @:native("LoadBytes") var loadBytes: go.debug.macho.LoadBytes;
    @:native("Name") var name: String;
    @:native("Time") var time: go.UInt32;
    @:native("CurrentVersion") var currentVersion: go.UInt32;
    @:native("CompatVersion") var compatVersion: go.UInt32;

function new(loadBytes: go.debug.macho.LoadBytes, name: String, time: go.UInt32, currentVersion: go.UInt32, compatVersion: go.UInt32);

    @:native("Raw") function raw(): go.Slice<go.Byte>;

}