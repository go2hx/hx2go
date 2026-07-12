function main() {
    bar(Foo);
}

function bar(d:Dynamic) {
    trace(d);
}

class Foo {}