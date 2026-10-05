package unit;

private typedef Recursive = Recursive->Int;

function main() {
    var f:Recursive = _ -> 7;
    assert(f(f) == 7);
}
