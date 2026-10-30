package unit;

private function allUnused(_, _) {
    return 42;
}

function main() {
    assert(allUnused("x", "y") == 42);
}
