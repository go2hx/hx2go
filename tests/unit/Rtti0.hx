package unit;
import haxe.PosInfos;
import haxe.rtti.Rtti;

function main() {
    var tst = Rtti.getRtti(Tst);
    // assert(haxe.Json.stringify(tst, "\t")); // DEBUG
    assert(tst.path == "Tst");
    assert(tst.superClass.path == "Tst0");
    assert(tst.meta.length == 2);  // other implementations include :somename type meta, and insert :directlyUsed 1st
    assert(tst.meta[0].name == "Elliott"); // other implementations have this at a different offset
    assert(tst.meta[0].params[0] == "was here"); // ditto
    assert(tst.interfaces[1].path == "I1");
    assert(tst.statics[0].name == "sf");
    assert(tst.statics[0].meta[0].name == "func");
    assert(tst.fields[1].name == "dingbat");
    assert(tst.fields[1].meta[0].name == "dodah");
    try {
        Rtti.getRtti(null); // this also tests hasRtti()
        assert(false);
    } catch (e) {
        assert(true); // check it throws
    }

    assert(0 == Reflect.fields(haxe.rtti.Meta.getFields(C)).length);
    assert(0 == Reflect.fields(haxe.rtti.Meta.getStatics(C)).length);
    assert(0 == Reflect.fields(haxe.rtti.Meta.getType(C1)).length);
}

@test
private class C {
}

private class C1 {
    @test function f() {}
}

interface I1 {}
interface I2 {}
class Tst0 {}

@Elliott("was here")
@:rtti
@author("Nicolas")
@:keep
class Tst extends Tst0 implements I1 implements I2 {
	@func
	public static function sf() {}

	@sss
	public static var s:String;

	@pongo
	public var x:Int;

	public function new(n:Float) {}

	@dodah
	public function dingbat() {}
}