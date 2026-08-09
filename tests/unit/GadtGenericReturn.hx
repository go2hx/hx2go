package unit;

// Reduced from unit.TestGADT.testFieldMatches (haxe/tests/unit).
// A GADT-style enum-abstract phantom type (MyTypeKind<K>) drives a local
// generic function whose return type is the type parameter T. hx2go returns
// `any` from the monomorphized function, so assigning the result into a
// concretely-typed local requires a Go type assertion that is not emitted:
//   cannot use matchTypeField(tInst) (value of interface type any) as string
//   value in assignment: need type assertion

private enum abstract MyTypeKind<K>(String) {
	var TInst:MyTypeKind<String>;
	var TEnum:MyTypeKind<Int>;
}

private typedef MyType<T> = {
	var kind:MyTypeKind<T>;
	var args:T;
}

function main() {
	function matchTypeField<T>(t:Null<MyType<T>>):T {
		return switch (t.kind) {
			case TInst: t.args;
			case TEnum: t.args;
		}
	}

	final tInst = {kind: TInst, args: "MyClass"};
	final tEnum = {kind: TEnum, args: 12};

	var s:String = matchTypeField(tInst);
	var i:Int = matchTypeField(tEnum);
	assert(s == "MyClass");
	assert(i == 12);
}
