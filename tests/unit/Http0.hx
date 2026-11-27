package unit;

#if go
import go.net.http.Server;
import go.Syntax;
import go.net.Http;

function main() {
    var server = new Server();
    Syntax.go(() -> {
        Http.handleFunc("/", (resp, req) -> {
            resp.header().add("h", "h0");
            resp.header().add("h", "h1");
            resp.write("ok");
        });

        server.addr = port;
        var err = server.listenAndServe();
        // TODO: missing Http.errServerClosed in the extern
        if (err.error() != "http: Server closed") {
            throw err;
        }
    });
    Syntax.defer(() -> server.close().sure());

    testClient(new haxe.Http(url), haxe.Http.requestUrl);
    testClient(new sys.Http(url), haxe.Http.requestUrl);
}

function testClient(client:haxe.http.HttpBase, requestUrl:String->String) {
    var responseData = requestUrl(url);
    assert(responseData == "ok");

    client.onData = data -> {
        responseData = data;
    };

    client.onError = msg -> {
        throw msg;
    };
    client.request();
    assert(responseData == "ok");

    var responseHeaders:Map<String,String> = (client : Dynamic).responseHeaders;
    assert(responseHeaders.get("H") == "h1");
    assert(responseHeaders.get("Content-Type") == "text/plain; charset=utf-8");
}

var port = ":3000";
var url =  'http://localhost$port';
#else
function main() {}
#end