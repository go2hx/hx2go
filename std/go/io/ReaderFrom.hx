package go.io;

@:go.Type({ name: "ReaderFrom", instanceName: "io.ReaderFrom", imports: ["io"] })
extern typedef ReaderFrom = {

    @:native("ReadFrom") function readFrom(r: go.io.Reader): (go.Result<go.Int64>);

}