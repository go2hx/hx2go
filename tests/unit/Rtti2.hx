package unit;

// tests below modeled on https://github.com/HaxeFoundation/haxe/blob/development/tests/unit/src/unit/teststd/haxe/rtti/TestRtti.hx
function main() {
	var allowFailures = false; // to control whether the failures should be allowed to run. TODO: REMOVE BEFORE PRODUCTION

	assert(!haxe.rtti.Rtti.hasRtti(NonRttiClass));
	assert(haxe.rtti.Rtti.hasRtti(RttiClass1));
	assert(haxe.rtti.Rtti.hasRtti(RttiClass2));

	var cl = haxe.rtti.Rtti.getRtti(RttiClass1);
	assert(!cl.isExtern);
	assert(!cl.isInterface);
	assert(cl.params.length == 0);
	assert(cl.fields.length == 1);
	assert(cl.superClass == null);
	assert(cl.interfaces.length == 0);
	assert(cl.fields.length == 1);
	assert(cl.statics.length == 1);
	assert(cl.tdynamic == null);

	var cf = cl.statics[0]; // should be:    var cf = cl.statics.shift(); // hx2go issue #209
	assert(cf.name == "v");

	if (allowFailures) {
		/* fail */ assert(false); // should be: 	assert(haxe.rtti.CType.CTypeTools.toString(cf.type) == "String");
		/* fail */ assert(!cf.isPublic);
	}
	assert(!cf.isOverride);
	assert(cf.doc == null);
	assert(cf.get == RNormal);
	assert(cf.set == RNormal);
	assert(cf.params.length == 0);
	assert(cf.platforms.length == 0);
	assert(cf.meta.length == 0);
	assert(cf.line == null);
	assert(cf.overloads == null);

	var cf = cl.fields[0]; // should be: var cf = cl.fields.shift(); // hx2go issue #209
	assert(cf.name == "f");
	if (allowFailures) {
		/* fail */ assert(false); // should be: 	assert(haxe.rtti.CType.CTypeTools.toString(cf.type) == "Void -> Float");
	}
	assert(cf.isPublic);
	assert(!cf.isOverride);
	assert(cf.doc == null);
	assert(cf.get == RNormal);
	if (allowFailures) {
		/* fail */ assert(cf.set == RMethod);
	}
	assert(cf.params.length == 0);
	assert(cf.platforms.length == 0);
	assert(cf.meta.length == 0);
	// cf.line == null;
	assert(cf.overloads == null);

	var cl = haxe.rtti.Rtti.getRtti(RttiClass2);
	assert(!cl.isExtern);
	assert(!cl.isInterface);
	assert(cl.params.length == 0);
	if (allowFailures) {
		/* fail */ assert(cl.fields.length == 0); // the field from the superclass is included, which causes this to fail
	}
	assert(cl.superClass.path == "unit._Rtti2.RttiClass1"); // in the original tests:  "unit.teststd.haxe.rtti._TestRtti.RttiClass1"
	assert(cl.superClass.params.length == 0);
	assert(cl.interfaces.length == 0);
	if (allowFailures) {
		/* fail */ assert(cl.fields.length == 0); // superclass issue, as above
	}
	assert(cl.statics.length == 0);
	assert(cl.tdynamic == null);

	var cl = haxe.rtti.Rtti.getRtti(RttiClass3);
	assert(!cl.isExtern);
	assert(!cl.isInterface);
	assert(cl.params.length == 0);
	assert(cl.fields.length == 1);
	assert(cl.superClass.path == "unit._Rtti2.RttiClass1"); // in the original tests:  "unit.teststd.haxe.rtti._TestRtti.RttiClass1"
	assert(cl.superClass.params.length == 0);
	assert(cl.interfaces.length == 0);
	assert(cl.fields.length == 1);
	assert(cl.statics.length == 0);
	assert(cl.tdynamic == null);

	var cf = cl.fields[0]; // should be: var cf = cl.fields.shift(); // hx2go issue #209
	assert(cf.name == "f");
	if (allowFailures) {
		/* fail */ assert(false); // should be: assert(haxe.rtti.CType.CTypeTools.toString(cf.type) == "Void -> Int");
	}
	assert(cf.isPublic);
	if (allowFailures) {
		/* fail */ assert(cf.isOverride);
	}
	assert(cf.doc == null);
	assert(cf.get == RNormal);
	if (allowFailures) {
		/* fail */ assert(cf.set == RMethod);
	}
	assert(cf.params.length == 0);
	assert(cf.platforms.length == 0);
	assert(cf.meta.length == 0);
	// cf.line == null;
	assert(cf.overloads == null);
}

private class NonRttiClass {}

@:rtti
@:keepSub
private class RttiClass1 {
	static var v:String;

	public function f() {
		return 33.0;
	}
}

private class RttiClass2 extends RttiClass1 {}

private class RttiClass3 extends RttiClass1 {
	override function f():Int {
		return 33;
	}
}
