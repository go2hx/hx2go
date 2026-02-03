package tests;

import Reflect;

class TestReflect {
	public static function main():String {

        // NOTE: only anonymous structures are implemented & tested at present
		var as = {
			i: 42,
			f: 42.1,
			b: true,
			s: "你好世界！"
		};

		if (Reflect.hasField(as, "b") != true)
			return "Reflect.hasField(as,b) != true";

        if (Reflect.hasField(as, "z") == true)
			return "Reflect.hasField(as,z) == true";

		if (Reflect.field(as, "f") != (42.1 : Dynamic))
			return "Reflect.field(as,f)!=(42.1:Dynamic)";

		Reflect.setField(as, "s", "Hello World!");
		if (Reflect.field(as, "s") != ("Hello World!" : Dynamic))
			return "setField() failure";

		if (Reflect.deleteField(as, "i") != true)
			return "deleteField reports failure";

		if (Reflect.hasField(as, "i") == true)
			return "deleteField() failed";

		var as2 = Reflect.copy(as);
		if (Reflect.fields(as).length == 0)
			return "copy() failed";

		return ""; // success
	}
}
