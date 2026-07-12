import go.Chan;
import go.Syntax;

function sum(arr: Array<Int>, chan: Chan<Int>) {
    var sum: Int = 0;
    for (v in arr) {
        sum += v;
    }

    chan.send(sum);
}

function main() {
    var arr: Array<Int> = [1, 2, 3, 4, 5, 6, 7, 8];
    var chan: Chan<Int> = new Chan();
    var half: Int = Std.int(arr.length / 2);

    Syntax.go(sum.bind(arr.slice(0, half), chan));
    Syntax.go(sum.bind(arr.slice(half), chan));

    var right = chan.receive();
    var left = chan.receive();

    trace(left, right, left + right);
}