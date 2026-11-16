package unit;

function main() {
    var calls = [];
    var collect = (args:Array<Dynamic>) -> {
        calls.push(args.length + ":" + args.join(","));
    };

    var varArgs = Reflect.makeVarArgs(collect);
    var rest:haxe.Rest<Int> -> Void = varArgs;
    varArgs(1, 2, 3);
    rest(4, 5);
    assert(calls.join("|") == "1:[1,2,3]|1:[4,5]");

    calls = [];
    var dynamicVarArgs = Reflect.makeVarArgs(collect);
    Reflect.callMethod(null, dynamicVarArgs, []);
    Reflect.callMethod(null, dynamicVarArgs, ["one"]);
    Reflect.callMethod(null, dynamicVarArgs, [1.5, true]);
    assert(calls.join("|") == "0:|1:one|2:1.5,true");
}
