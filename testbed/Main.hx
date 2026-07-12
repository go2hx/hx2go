function main() {
    var v: Class<Foo> = Foo;
    bar(v);
}

function bar(d:Dynamic) {
    trace(d);
}

class Foo {}