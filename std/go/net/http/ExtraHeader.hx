package go.net.http;

@:structInit
@:go.Type({ name: "extraHeader", instanceName: "http.extraHeader", imports: ["net/http"] })
extern class ExtraHeader {

    @:native("Write") function write(w: go.Pointer<go.bufio.Writer>): Void;

}