package unit;

function main() {
    f(10);
    f(null);
    Sys.print(null);
}

function f<T>(x:T) {
    var x:T = null;
    Sys.print(x);
}