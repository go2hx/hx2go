package unit;

import go.Os;
import go.golang_org.x.Term;
import go.Go;

function main() {
    var obj = Term.getSize(Go.int(Os.stdin.fd()));
    obj.err.sure();
    trace(obj.width, obj.height);
}