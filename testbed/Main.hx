import go.Chan;
import go.Syntax;
import go.ReceiveChan;
import go.SendChan;
import haxe.io.Bytes;

function main() {
    var bytes = Bytes.alloc(128);
    trace(bytes);
}