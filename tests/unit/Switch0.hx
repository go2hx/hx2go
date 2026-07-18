package unit;

function main() {
    // value-position switch in return position, with or-patterns + default
    assert(isGreeting("hi") == true);
    assert(isGreeting("hey") == true);
    assert(isGreeting("hello") == true);
    assert(isGreeting("bye") == false);

    // value-position switch in var-init position
    var n = classify(0);
    assert(n == "zero");
    assert(classify(1) == "positive");
    assert(classify(-4) == "negative");

    // statement-position switch still works (control side-effect only)
    var hit = 0;
    switch (2) {
        case 1: hit = 10;
        case 2: hit = 20;
        default: hit = 99;
    }
    assert(hit == 20);

    // value-position switch with multi-statement case bodies (tail is the value)
    assert(scoreOf("hi") == 3);
    assert(scoreOf("nope") == 0);
}

function isGreeting(x: String): Bool {
    return switch x {
        case "hi", "hey", "hello":
            true;
        default:
            false;
    }
}

function classify(x: Int): String {
    return switch x {
        case 0: "zero";
        default: x > 0 ? "positive" : "negative";
    }
}

function scoreOf(x: String): Int {
    var score = switch x {
        case "hi", "hey", "hello":
            var base = 1;
            base + 2;
        default:
            0;
    }
    return score;
}
