package go.net.http;

@:go.Type({ name: "Hijacker", instanceName: "http.Hijacker", imports: ["net/http"] })
extern typedef Hijacker = {

    @:go.Tuple("p0", "p1", "p2") @:native("Hijack") function hijack(): go.Tuple<{ p0: go.net.Conn, p1: go.Pointer<go.bufio.ReadWriter>, p2: go.Error }>;

}