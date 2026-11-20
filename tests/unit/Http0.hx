package unit;

import go.Syntax;
import go.net.Http;

function main() {
    Syntax.go(() -> {
        Http.handleFunc("/", (resp, req) -> {
            resp.write("ok");
        });
        throw Http.listenAndServe(":3000", null);
    });
    var resp = haxe.Http.requestUrl("http://localhost:3000");
    assert(resp == "ok");
}