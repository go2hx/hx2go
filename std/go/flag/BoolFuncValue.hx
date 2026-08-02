package go.flag;

@:go.Type({ name: "boolFuncValue", instanceName: "flag.boolFuncValue", imports: ["flag"] })
extern class BoolFuncValue {

    @:native("IsBoolFlag") function isBoolFlag(): (Bool);
    @:native("Set") function set(s: String): (go.Error);
    @:native("String") function string(): (String);

}