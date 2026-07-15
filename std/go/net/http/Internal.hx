package go.net.http;

@:go.Type({ name: "internal", instanceName: "internal.internal", imports: ["net/http/internal"] })
extern class Internal {

    @:native("NewChunkedReader") static function newChunkedReader(r: go.io.Reader): go.io.Reader;
    @:native("NewChunkedWriter") static function newChunkedWriter(w: go.io.Writer): go.io.WriteCloser;

}