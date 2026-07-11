package unit;


import go.fmt.Fmt;
import go.Syntax;

function main() {
    var flag = false;

    Syntax.defer(() -> {
        assert(flag == true);
    });

    Syntax.code("{0} = {1}", flag, true);
}
