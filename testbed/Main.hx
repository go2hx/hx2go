import go.Map;
import go.Slice;

function command(cmd: String, ?args: Array<String>): Int {
    var arg: Slice<String> = Slice.fromArray(args ?? []);
    trace(arg);

    return 0;
}

function main() {
    command("hello");
    command("hello", ["world"]);
}