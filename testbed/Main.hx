import go.Syntax;

function main() {
    var x: Dynamic = 5;

    switch Syntax.type(x) {
        case Bool: trace("You are a bool");
        case Int: trace("You are an int");
        case Float: trace("You are a float");
        case _: trace("What are you?!?");
    }
}