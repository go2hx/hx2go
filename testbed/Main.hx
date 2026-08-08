function main() {
    var v = (x: Array<Dynamic>) -> {
        trace(x, x.length, x.pop());
    }

    var vr: Dynamic = Reflect.makeVarArgs(v);
    v([6, 5, 4]);
    v = (x: Array<Dynamic>) -> {
        trace("hi");
    }

    vr(1, 2, 3);
    v([]);
}