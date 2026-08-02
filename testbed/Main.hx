function main() {
    makeExpr2();
}

function makeExpr2():Void->Dynamic {
    return function() {
        var v:Dynamic = true;
        return (v == null || v == false);
    };
}