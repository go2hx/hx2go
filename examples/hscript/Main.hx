function main() {
    var script = "
        var sum = 0;
        for (a in angles) {
            sum += Math.cos(a);
        }

        sum;
    ";

    var parser = new hscript.Parser();
    var program = parser.parseString(script);
    var interp = new hscript.Interp();

    interp.variables.set("Math", Math);
    interp.variables.set("angles", [0, 1, 2, 3]);

    trace(interp.execute(program));
}