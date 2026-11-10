package unit;

private function rest(?arg: Int, ...args: Int): Int {
    return args.length;
}

function main() {
    assert(rest() == 0);
    assert(rest(1) == 0);
    assert(rest(1, 2, 3) == 2);
}
