function main() {
    var x: Void->Void = () -> {
        trace("Hellooow!");
    }

    var y: Null<Void->Void> = x;

    x();
    y();

    var z: Null<Int->Int->Void> = (x, y) -> {
        trace("Sum is", x + y);
    };

    z(50, 50);
}