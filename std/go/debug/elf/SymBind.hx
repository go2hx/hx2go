package go.debug.elf;

@:go.Type({ name: "SymBind", instanceName: "elf.SymBind", imports: ["debug/elf"] })
extern typedef SymBind = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>