package unit;
import haxe.Exception;
import haxe.CallStack;

private function u( s : String ) : String {
		return s;
	}

private function u2( s : String, s2 ) : String {
		//return u(s) + "." + u(s2);
		return u(s2);
	}

private var TNAMES = [
		"null","Int","String","Bool","Float",
		"Array",u("haxe.ds.StringMap"),u("haxe.ds.List"),"Date","Xml","Math",
		u2("unit","MyEnum"),u2("unit","MyClass"),u2("unit","MySubClass"),
		u("Class"), u("Enum"), u("Dynamic"),
		u2("unit","MyInterface")
	];

	var TYPES : Array<Dynamic> = [
		null,Int,String,Bool,Float,
		Array,haxe.ds.StringMap,List,Date,Xml,Math,
		MyEnum,MyClass,MySubClass,
		Class,Enum,Dynamic,MyInterface
	];

function main() {
	for( i in 1...TYPES.length ) {
		var t : Dynamic = TYPES[i];
		var name = TNAMES[i];
		assert(t != null);
		if( name == u("Enum") || name == u("Bool") || name == u("Int") || name == u("Float") || name == u("Class") || name == u("Dynamic") ) {
			// neither an enum or a class
		} else if( t == MyEnum ) {
			assert( Type.getEnumName(t) == name );
			assert( Type.resolveEnum(name) == t );
		} else {
			assert( Type.getClassName(t) == name );
			assert( Type.resolveClass(name) == t );
		}
	}
}

private enum MyEnum {
	A;
	B;
	C( a : Int, b : String );
	D( e : MyEnum );
}

private class MyClass {
	public function new() {}
	public function get() {
		return 10;
	}
}

private class MySubClass extends MyClass {

	public override function get() {
		return 2;
	}

	@:keep static var XXX = 3;

}

private interface MyInterface
{
}