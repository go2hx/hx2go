package unit;

private enum Link { Node(value:Dynamic); }

function main() {
    var object = {self: (null:Dynamic)};
    object.self = object;
    assert(Std.string(object).indexOf("<...>") != -1);

    var value = Node(object);
    object.self = value;
    assert(Std.string(value).indexOf("<...>") != -1);

    var array:Array<Dynamic> = [];
    array.push(array);
    assert(Std.string(array).indexOf("<...>") != -1);
}
