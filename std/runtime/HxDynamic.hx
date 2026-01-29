package runtime;

import go.reflect.Reflect;

class HxDynamic {

	public inline static function level(x:Dynamic):Int { // TODO return value not working, changes needed to parser/dump/ExprParser.hx:286
		var sL = Reflect.typeOf(x).kind().string();

		if (sL == "int")
			return 1;
		if (sL == "float64")
			return 2;
		if (sL == "string")
			return 3;

		return 0;
	}

}
