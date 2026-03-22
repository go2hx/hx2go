import go.Fmt;

function main() {
    Fmt.println(get().getName());
    Fmt.println(get().getIndex());
    Fmt.println(get2().getIndex());
}

class Foo2 {}

function get()
    return Foo.A;

function get2()
    return Foo.B;


enum Foo {
    A;
    B;
    C(f:Foo);
}