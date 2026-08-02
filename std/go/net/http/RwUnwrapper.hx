package go.net.http;

@:go.Type({ name: "rwUnwrapper", instanceName: "http.rwUnwrapper", imports: ["net/http"] })
extern typedef RwUnwrapper = {

    @:native("Unwrap") function unwrap(): (go.net.http.ResponseWriter);

}