package unit;

function main() {
    assert(fromFloat(10.5) == 10);
}

function fromFloat(f:Float) {
    var noFractions = f - (f % 1);
    return noFractions;
}