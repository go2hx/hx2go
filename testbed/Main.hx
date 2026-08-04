//import haxe.Http;
//
//function main() {
//    trace(
//        Http.requestUrl("http://raw.githubusercontent.com/go2hx/hx2go/refs/heads/main/README.md")
//    );
//}

function main() {
    var items = ["a", "b", "c"];
    trace(Lambda.exists(items, (v) -> {
        return v == "c";
    }));
}