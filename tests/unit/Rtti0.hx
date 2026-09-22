package unit;
import haxe.PosInfos;
import haxe.rtti.Rtti;

function main() {
    var tst = Rtti.getRtti(Tst);
    assert(tst.path.indexOf("Tst") != -1);
    assert(tst.superClass.path.indexOf("Tst0") != -1);
    trace(tst.meta.length);
    trace(tst.meta.map(m -> m.name));
    assert(tst.meta.length >= 2);
    var index = -1;
    for (i in 0...tst.meta.length) {
        if (tst.meta[i].name == "Elliott") {
            index = i;
            break;
        }
    }
    assert(index != -1);
    trace(tst.meta[index].params, tst.meta[index].params[0]);
    assert(removeQuotes(tst.meta[index].params[0]) == "was here");
    assert(tst.interfaces[1].path.indexOf("I1") != -1);
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

private function removeQuotes(s:String) {
    if (s.charAt(0) == '"' && s.charAt(s.length - 1) == '"')
        return s.substring(1, s.length - 1);
    return s;
}

@test
private class C {
}

private class C1 {
    @test function f() {}
}

private interface I1 {}
private interface I2 {}
private class Tst0 {}

@Elliott("was here")
@:rtti
@author("Nicolas")
@:keep
private class Tst extends Tst0 implements I1 implements I2 {
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