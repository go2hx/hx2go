package go.net.http;

@:go.Type({ name: "CloseNotifier", instanceName: "http.CloseNotifier", imports: ["net/http"] })
extern typedef CloseNotifier = {

    @:native("CloseNotify") function closeNotify(): go.Chan<Bool>;

}