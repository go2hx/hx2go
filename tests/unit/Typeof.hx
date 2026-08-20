package unit;
import Type;

function main() {
    assert(Type.typeof(MyClass) == TObject);
    assert(Type.typeof(MyEnum) == TObject);
    assert(Type.typeof(new MyClass()).match(TClass(_)));
    #if go
    assert(Type.typeof(new go.Slice()) == TObject);
    #end
    assert(Type.typeof(Class) == TObject);
    assert(Type.typeof(Enum) == TObject);
}

enum MyEnum {
	A;
	B;
	C( a : Int, b : String );
	D( e : MyEnum );
}

class MyClass {
    public function new() {}
}