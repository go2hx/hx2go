package go.debug.macho;

@:go.Type({ name: "LoadBytes", instanceName: "macho.LoadBytes", imports: ["debug/macho"] })
extern class LoadBytes {

    @:native("Raw") function raw(): go.Slice<go.Byte>;

}