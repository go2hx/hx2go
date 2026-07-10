package unit;


function main() {
    var x: Void->Int = () -> {
        return 42;
    }

    var y: Null<Void->Int> = x;

    assert(x() == 42);
    assert(y() == 42);
}
