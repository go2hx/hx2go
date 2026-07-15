package go.net.http.cgi;

@:structInit
@:go.Type({ name: "Handler", instanceName: "cgi.Handler", imports: ["net/http/cgi"] })
extern class Handler {

    @:native("Path") var path: String;
    @:native("Root") var root: String;
    @:native("Dir") var dir: String;
    @:native("Env") var env: go.Slice<String>;
    @:native("InheritEnv") var inheritEnv: go.Slice<String>;
    @:native("Logger") var logger: go.Pointer<go.log.Logger>;
    @:native("Args") var args: go.Slice<String>;
    @:native("Stderr") var stderr: go.io.Writer;
    @:native("PathLocationHandler") var pathLocationHandler: go.net.http.Handler;

function new(path: String, root: String, dir: String, env: go.Slice<String>, inheritEnv: go.Slice<String>, logger: go.Pointer<go.log.Logger>, args: go.Slice<String>, stderr: go.io.Writer, pathLocationHandler: go.net.http.Handler);

    @:native("ServeHTTP") function serveHTTP(rw: go.net.http.ResponseWriter, req: go.Pointer<go.net.http.Request>): Void;

}