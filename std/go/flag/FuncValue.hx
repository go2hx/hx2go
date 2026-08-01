package go.flag;

@:go.Type({ name: "funcValue", instanceName: "flag.funcValue", imports: ["flag"] })
extern class FuncValue {

    @:native("Set") function set(s: String): (go.Error);
    @:native("String") function string(): (String);

}