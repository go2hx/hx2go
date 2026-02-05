package tests.runtime;

import runtime.HxDynamic;

class TestHxDynamic {
	public static function main():String {
		// test the correct paths

		//
		// unary operators
		//
		if (HxDynamic.not(true) == (true : Dynamic))
			return "HxDynamic.not(true)==(true:Dynamic)";

		if (HxDynamic.increment(1) != (2 : Dynamic))
			return "HxDynamic.increment(1)!=(2:Dynamic)";

		if (HxDynamic.increment(1.1) != (2.1 : Dynamic))
			return "HxDynamic.increment(1.1)!=(2.1:Dynamic)";

		if (HxDynamic.decrement(2) != (1 : Dynamic))
			return "HxDynamic.decrement(2)!=(1:Dynamic)";

		if (HxDynamic.decrement(2.1) != (1.1 : Dynamic))
			return "HxDynamic.decrement(2.1)!=(1.1:Dynamic)";

		if (HxDynamic.negate(1) != (-1 : Dynamic))
			return "HxDynamic.negate(1)!=(-1:Dynamic)";

		if (HxDynamic.negate(2.1) != (-2.1 : Dynamic))
			return "HxDynamic.negate(2.1)!=(-2.1:Dynamic)";

		if (HxDynamic.bitnot(-1) != (0 : Dynamic))
			return "HxDynamic.bitnot(1)!=(0:Dynamic)";

		//
		// TODO binary operators
		//

		return ""; // success
	}
}
