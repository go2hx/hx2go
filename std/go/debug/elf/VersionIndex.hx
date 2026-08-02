package go.debug.elf;

@:go.Type({ name: "VersionIndex", instanceName: "elf.VersionIndex", imports: ["debug/elf"] })
extern typedef VersionIndex = haxe.extern.EitherType<go.UInt16, {
    @:native("Index") function index(): (go.UInt16);
    @:native("IsHidden") function isHidden(): (Bool);

}>