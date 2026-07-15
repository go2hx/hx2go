package go.internal.bisect;

@:go.Type({ name: "Writer", instanceName: "bisect.Writer", imports: ["internal/bisect"] })
extern typedef Writer = {

    @:native("Write") function write(p0: go.Slice<go.Byte>): go.Result<go.GoInt>;

}