package tests.runtime;

import runtime.HxDynamic;

class TestHxDynamic {
	public static function main():String {
		// test the correct paths only here
		// TODO test incorrect/error paths

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
		// binary operators
		//

		if (HxDynamic.and(true, false) != (false : Dynamic))
			return "HxDynamic.and(true,false)";
		if (HxDynamic.or(false, false) != (false : Dynamic))
			return "HxDynamic.or(false,false)";

		if (HxDynamic.equals(null, null) == (false : Dynamic))
			return "HxDynamic.equals(null,null)==false";
		if (HxDynamic.equals(false, false) == (false : Dynamic))
			return "HxDynamic.equals(false,false)==false";
		if (HxDynamic.equals(123, 123) == (false : Dynamic))
			return "HxDynamic.equals(123,123)==false";
		if (HxDynamic.equals(1.23, 1.23) == (false : Dynamic))
			return "HxDynamic.equals(1.23,1.23)==false";
		if (HxDynamic.equals(123, 123.0) == (false : Dynamic))
			return "HxDynamic.equals(123,123.0)==false";
		if (HxDynamic.equals("ABC", "ABC") == (false : Dynamic))
			return "HxDynamic.equals('ABC','ABC')==false";

		if (HxDynamic.nequals("ABC", "ABC") != (false : Dynamic))
			return "HxDynamic.equals('ABC','ABC')!=false";

		if (HxDynamic.lt(123, 124) == (false : Dynamic))
			return "HxDynamic.lt(123,124)==false";
		if (HxDynamic.lt(1.23, 1.24) == (false : Dynamic))
			return "HxDynamic.lt(1.23,1.24)==false";
		if (HxDynamic.lt(123, 124.0) == (false : Dynamic))
			return "HxDynamic.lt(123,124.0)==false";
		if (HxDynamic.lt("ABC", "BCD") == (false : Dynamic))
			return "HxDynamic.lt('ABC','BCD')==false";

		if (HxDynamic.gtequals("ABC", "BCD") != (false : Dynamic))
			return "HxDynamic.gtequals('ABC','BCD')!=false";

		if (HxDynamic.gt(123, 124) != (false : Dynamic))
			return "HxDynamic.gt(123,124)!=false";
		if (HxDynamic.gt(1.23, 1.24) != (false : Dynamic))
			return "HxDynamic.gt(1.23,1.24)!=false";
		if (HxDynamic.gt(123, 124.0) != (false : Dynamic))
			return "HxDynamic.gt(123,124.0)!=false";
		if (HxDynamic.gt("ABC", "BCD") != (false : Dynamic))
			return "HxDynamic.gt('ABC','BCD')!=false";

		if (HxDynamic.ltequals("ABC", "BCD") == (false : Dynamic))
			return "HxDynamic.gtequals('ABC','BCD')==false";

		if (HxDynamic.add(2, 2) != (4 : Dynamic))
			return "HxDynamic.add(2,2)!=4";
		if (HxDynamic.add(2.3, 2.3) != (4.6 : Dynamic))
			return "HxDynamic.add(2.3,2.3)!=4.6";
		if (HxDynamic.add(2, 2.3) != (4.3 : Dynamic))
			return "HxDynamic.add(2,2.3)!=4.3";
		if (HxDynamic.add(2.3, 2) != (4.3 : Dynamic))
			return "HxDynamic.add(2.3,2)!=4.3";
		var si = HxDynamic.add("The answer to life the universe and everything is ", 42);
		// Sys.println(si);
		if (si != ("The answer to life the universe and everything is 42" : Dynamic))
			return "HxDynamic.add the answer...";

		if (HxDynamic.subtract(2, 2) != (0 : Dynamic))
			return "HxDynamic.subtract(2,2)!=0";
		if (HxDynamic.subtract(2.3, 2.3) != (0.0 : Dynamic))
			return "HxDynamic.subtract(2.3,2.3)!=0.0";
		if (HxDynamic.subtract(2, 2.5) != (-0.5 : Dynamic))
			return "HxDynamic.subtract(2,2.5)!=-0.5";
		if (HxDynamic.subtract(2.5, 2) != (0.5 : Dynamic))
			return "HxDynamic.subtract(2.5,2)!=0.5";

		if (HxDynamic.multiply(2, 2) != (4 : Dynamic))
			return "HxDynamic.multiply(2,2)!=4";
		if (HxDynamic.multiply(2.5, 2.0) != (5.0 : Dynamic))
			return "HxDynamic.multiply(2.5,2)!=5.0";
		if (HxDynamic.multiply(2, 2.5) != (5.0 : Dynamic))
			return "HxDynamic.multiply(2,2.5)!=5.0";

		if (HxDynamic.divide(2, 2) != (1.0 : Dynamic))
			return "HxDynamic.divide(2,2)!=2/2";
		if (HxDynamic.divide(21.0, 7) != (3.0 : Dynamic))
			return "HxDynamic.divide(21。0,7)!=3.0";

		if (HxDynamic.modulo(22, 7) != (1 : Dynamic))
			return "HxDynamic.modulo(22,7)!=1";

		if (HxDynamic.bitand(1, 1) != (1 : Dynamic))
			return "HxDynamic.bitand(1,1)!=1";

		if (HxDynamic.bitor(0, 1) != (1 : Dynamic))
			return "HxDynamic.bitor(0,1)!=1";

		if (HxDynamic.bitxor(1, 1) != (0 : Dynamic))
			return "HxDynamic.bitxor(1,1)!=0";

		if (HxDynamic.lbitshift(1, 1) != (2 : Dynamic))
			return "HxDynamic.bitshift(1,1)!=2";

		if (HxDynamic.rbitshift(-1, 1) != (-1 : Dynamic))
			return "HxDynamic.rbitshift(-1,1)!=-1";

		var urb = HxDynamic.urbitshift(-1, 63);
		// Sys.println(urb);
		if (urb != (1 : Dynamic))
			return "HxDynamic.urbitshift(-1,63)!=1";

		return ""; // success
	}
}
