package go.io;

@:go.Type({ name: "Seeker", instanceName: "io.Seeker", imports: ["io"] })
extern typedef Seeker = {

    @:native("Seek") function seek(offset: go.Int64, whence: go.GoInt): (go.Result<go.Int64>);

}