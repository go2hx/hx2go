package go.debug.elf;

@:structInit
@:go.Type({ name: "nobitsSectionReader", instanceName: "elf.nobitsSectionReader", imports: ["debug/elf"] })
extern class NobitsSectionReader {

    @:native("ReadAt") function readAt(p: go.Slice<go.Byte>, off: go.Int64): (go.Result<go.GoInt>);

}