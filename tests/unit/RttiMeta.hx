package unit;

import haxe.rtti.Meta;

@:rtti
@author("Nicolas")
@:keep
private class MyClass {
	@range(1, 8)
	var value:Int;

	@broken
	static function method() {}
}

function main() {
	var type = Meta.getType(MyClass);
	assert(type != null);
	var author:Array<Dynamic> = Reflect.field(type, "author");
	assert(author != null);
	assert(author[0] == "Nicolas");

	var fields = Meta.getFields(MyClass);
	assert(fields != null);
	var range:Array<Dynamic> = fields.value.range;
	assert(range[0] == 1);
	assert(range[1] == 8);

	var statics = Meta.getStatics(MyClass);
	assert(statics != null);
	assert(statics.method != null);
}
