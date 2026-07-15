package go.debug.macho;

@:structInit
@:go.Type({ name: "Rpath", instanceName: "macho.Rpath", imports: ["debug/macho"] })
extern class Rpath {

    @:native("LoadBytes") var loadBytes: go.debug.macho.LoadBytes;
    @:native("Path") var path: String;

function new(loadBytes: go.debug.macho.LoadBytes, path: String);

    @:native("Raw") function raw(): go.Slice<go.Byte>;

}