package go.internal.xcoff;

@:structInit
@:go.Type({ name: "Archive", instanceName: "xcoff.Archive", imports: ["internal/xcoff"] })
extern class Archive {

    @:native("ArchiveHeader") var archiveHeader: go.internal.xcoff.ArchiveHeader;
    @:native("Members") var members: go.Slice<go.Pointer<go.internal.xcoff.Member>>;

function new(archiveHeader: go.internal.xcoff.ArchiveHeader, members: go.Slice<go.Pointer<go.internal.xcoff.Member>>);

    @:native("Close") function close(): go.Error;
    @:native("GetFile") function getFile(name: String): go.Result<go.Pointer<go.internal.xcoff.File>>;

}