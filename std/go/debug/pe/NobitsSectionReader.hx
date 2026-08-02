package go.debug.pe;

@:structInit
@:go.Type({ name: "nobitsSectionReader", instanceName: "pe.nobitsSectionReader", imports: ["debug/pe"] })
extern class NobitsSectionReader {

    @:native("ReadAt") function readAt(p: go.Slice<go.Byte>, off: go.Int64): (go.Result<go.GoInt>);

}