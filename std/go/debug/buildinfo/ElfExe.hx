package go.debug.buildinfo;

@:structInit
@:go.Type({ name: "elfExe", instanceName: "buildinfo.elfExe", imports: ["debug/buildinfo"] })
extern class ElfExe {

    @:native("DataReader") function dataReader(addr: go.UInt64): (go.Result<go.io.ReaderAt>);
    @:go.Tuple("p0", "p1") @:native("DataStart") function dataStart(): (go.Tuple<{ p0: go.UInt64, p1: go.UInt64 }>);

}