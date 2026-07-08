import go.Syntax;

function foo() {
    trace('bar');
}

function log(x) {
    trace(x);
}

function main() {
    Syntax.defer(() -> {
        trace('a');
    });

    Syntax.defer(foo);
    Syntax.defer(log.bind("Hello, World!"));

    Syntax.go(() -> {
        trace('b');
    });

    Syntax.go(foo);
}