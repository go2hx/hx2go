import go.Syntax;

function main() {
    var x = 0;
    var end = false;

    while (true) {
        switch Syntax.code("{0}", x) {
            case 0:
                break;
            case 1:
                trace(1);
        }
        end = true;
        break;
    }

    switch Syntax.code("{0}", x) {
        case 0:
            while (true) {
                trace('f');
                break;
            }

        case 1:
            trace(1);
    }
    trace(end);
}