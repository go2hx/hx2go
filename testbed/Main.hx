import haxe.crypto.Sha512;
import haxe.io.Bytes;
import haxe.ds.Vector;

function main() {
    var garbage = "";
    for (i in 0...2048) {
        garbage += String.fromCharCode(41 + Std.int(Math.random() * 26));
    }

    var start = Sys.time();
    for (i in 0...10000) {
        Sha512.encode(garbage);
    }
    var end = Sys.time();

    trace('took ${end - start}s');

}