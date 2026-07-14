import go.fmt.Fmt;

function test(...v: Int) {
    Fmt.println(...v);
}

function main() {
    test(1, 2, 3);
}