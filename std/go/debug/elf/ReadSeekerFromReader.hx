package go.debug.elf;

@:structInit
@:go.Type({ name: "readSeekerFromReader", instanceName: "elf.readSeekerFromReader", imports: ["debug/elf"] })
extern class ReadSeekerFromReader {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("Seek") function seek(offset: go.Int64, whence: go.GoInt): (go.Result<go.Int64>);

}