package go.net.http;

@:structInit
@:go.Type({ name: "ResponseController", instanceName: "http.ResponseController", imports: ["net/http"] })
extern class ResponseController {

    @:native("EnableFullDuplex") function enableFullDuplex(): go.Error;
    @:native("Flush") function flush(): go.Error;
    @:go.Tuple("p0", "p1", "p2") @:native("Hijack") function hijack(): go.Tuple<{ p0: go.net.Conn, p1: go.Pointer<go.bufio.ReadWriter>, p2: go.Error }>;
    @:native("SetReadDeadline") function setReadDeadline(deadline: go.time.Time): go.Error;
    @:native("SetWriteDeadline") function setWriteDeadline(deadline: go.time.Time): go.Error;

}