package go.go.types;

@:structInit
@:go.Type({ name: "TypeAndValue", instanceName: "types.TypeAndValue", imports: ["go/types"] })
extern class TypeAndValue {

    @:native("Type") var type: go.go.types.Type;
    @:native("Value") var value: go.go.constant.Value;

function new(type: go.go.types.Type, value: go.go.constant.Value);

    @:native("Addressable") function addressable(): Bool;
    @:native("Assignable") function assignable(): Bool;
    @:native("HasOk") function hasOk(): Bool;
    @:native("IsBuiltin") function isBuiltin(): Bool;
    @:native("IsNil") function isNil(): Bool;
    @:native("IsType") function isType(): Bool;
    @:native("IsValue") function isValue(): Bool;
    @:native("IsVoid") function isVoid(): Bool;

}