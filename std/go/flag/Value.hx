package go.flag;

@:go.Type({ name: "Value", instanceName: "flag.Value", imports: ["flag"] })
extern typedef Value = {

    @:native("Set") function set(p0: String): go.Error;
    @:native("String") function string(): String;

}