import go.Syntax;
import go.net.Http;
import go.tailscale_com.tsnet.Server;

function main(): Void {
    var srv: Server = untyped {
        hostname: 'hx2go',
        ephemeral: true
    };

    Syntax.defer(srv.close);

    var ln = srv.listen('tcp', ':80').sure();
    var lc = srv.localClient().sure();
    var mux = Http.newServeMux();

    mux.handleFunc('/', (w, r) -> {
        var who = lc.whoIs(r.context(), r.remoteAddr).tuple();
        if (who.error != null) {
            Http.error(w, who.error.error(), 500);
            return;
        }

        var user = who.result.userProfile;
        var node = who.result.node;
        w.write('Hello, ${user.displayName} (${user.loginName})!\nYou are connecting from ${node.computedName}, served by Haxe.\n');
    });

    trace('listening on http://hx2go/');
    trace(Http.serve(ln, mux));
}