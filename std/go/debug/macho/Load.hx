package go.debug.macho;

@:go.Type({ name: "Load", instanceName: "macho.Load", imports: ["debug/macho"] })
extern typedef Load = {

    @:native("Raw") function raw(): go.Slice<go.Byte>;

}