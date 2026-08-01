package go.debug.elf;

@:go.Type({ name: "R_RISCV", instanceName: "elf.R_RISCV", imports: ["debug/elf"] })
extern typedef R_RISCV = haxe.extern.EitherType<go.GoInt, {
    @:native("GoString") function goString(): (String);
    @:native("String") function string(): (String);

}>