package go.debug.elf;

@:structInit
@:go.Type({ name: "Prog", instanceName: "elf.Prog", imports: ["debug/elf"] })
extern class Prog {

    @:native("ProgHeader") var progHeader: go.debug.elf.ProgHeader;
    @:native("ReaderAt") var readerAt: go.io.ReaderAt;

function new(progHeader: go.debug.elf.ProgHeader, readerAt: go.io.ReaderAt);

    @:native("Open") function open(): go.io.ReadSeeker;
    @:native("ReadAt") function readAt(p: go.Slice<go.Byte>, off: go.Int64): go.Result<go.GoInt>;

}