package unit;
function main() {
	var c = new ClassWithProp();
	// instance fields
	assert(Reflect.fields(c).length == 0);
	// static var
	// look up
	var cl = Type.resolveClass("ClassWithProp");
	assert(Reflect.field(cl, "STAT_X") == 6);
	Reflect.setField(cl, "STAT_X", 11);
	assert(Reflect.field(cl, "STAT_X") == 11);
	assert(Reflect.fields(cl).length > 0);
	// access directly
	assert(Reflect.field(ClassWithProp, "STAT_Y") == 10);
	assert(Reflect.hasField(ClassWithProp, "STAT_Y"));
	Reflect.setField(ClassWithProp, "STAT_Y", 11);
	assert(Reflect.field(ClassWithProp, "STAT_Y") == 11);
	// static prop
	assert(ClassWithProp.STAT_X == 11);

	Reflect.setProperty(ClassWithProp, "STAT_X", 8);

	assert(ClassWithProp.STAT_X == 16);
	assert(Reflect.getProperty(ClassWithProp, "STAT_X") == 16);


}


function eq(a, b) {
	assert(a, b);
}

class ClassWithProp {
	public function new() {}
	public static var STAT_X(default, set) : Int;
	public static var STAT_Y:Int = 10;

	static function set_STAT_X(v) {
		STAT_X = v * 2;
		return v;
	}

	static function __init__() {
		STAT_X = 3;
	}

}