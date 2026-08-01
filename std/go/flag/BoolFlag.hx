package go.flag;

@:go.Type({ name: "boolFlag", instanceName: "flag.boolFlag", imports: ["flag"] })
extern typedef BoolFlag = {

    @:native("IsBoolFlag") function isBoolFlag(): (Bool);
    @:native("Set") function set(p0: String): (go.Error);
    @:native("String") function string(): (String);

}