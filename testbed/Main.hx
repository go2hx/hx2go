import go.Syntax;

function main() {
    var x: Dynamic = 5;
    var y: String = switch Syntax.type(x) {
        case Int: "int";
        case Float: "float";
        case _: "other";
    }
}