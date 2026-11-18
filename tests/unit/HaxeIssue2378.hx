package unit;

private typedef CType = String;

private enum Kind {
	Function(args:Array<String>, ?varArgs:Null<CType>);
}

function main() {
	var k = Type.createEnum(Kind, "Function", [["a"], "b"]);
	assert(Std.string(k) == "Function([a],b)");
}
