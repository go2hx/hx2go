package unit;

import haxe.ds.StringMap;

// Reduced from unit.TestBasetypes.testStringMap (haxe/tests/unit).
// Copying a StringMap<Null<Int>> into an array (Lambda.array) unwraps each
// nullable value and assigns it into the array's element slot; hx2go emits a
// bare value/nil where a struct{Value int32; Valid bool} is expected:
//   cannot use _hx_tmp (variable of interface type any) as
//   struct{Value int32; Valid bool} value in assignment: need type assertion

function main() {
	var h = new StringMap<Null<Int>>();
	h.set("x", -1);
	h.set("abcd", 8546);

	var k = Lambda.array(h);
	k.sort(Reflect.compare);
	assert(k.join("#") == "-1#8546");

	h.set("x", null);
	assert(h.get("x") == null);
}
