package go.go.types;

@:structInit
@:go.Type({ name: "_TypeSet", instanceName: "types._TypeSet", imports: ["go/types"] })
extern class T_TypeSet {

    @:native("IsAll") function isAll(): (Bool);
    @:native("IsComparable") function isComparable(seen: go.Map<go.go.types.Type, Bool>): (Bool);
    @:native("IsEmpty") function isEmpty(): (Bool);
    @:native("IsMethodSet") function isMethodSet(): (Bool);
    @:go.Tuple("p0", "p1") @:native("LookupMethod") function lookupMethod(pkg: go.Pointer<go.go.types.Package>, name: String, foldCase: Bool): (go.Tuple<{ p0: go.GoInt, p1: go.Pointer<go.go.types.Func> }>);
    @:native("Method") function method(i: go.GoInt): (go.Pointer<go.go.types.Func>);
    @:native("NumMethods") function numMethods(): (go.GoInt);
    @:native("String") function string(): (String);

}