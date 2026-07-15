package go.flag;

@:go.Type({ name: "Getter", instanceName: "flag.Getter", imports: ["flag"] })
extern typedef Getter = {

    @:native("Get") function get(): Dynamic;
    @:native("Set") function set(p0: String): go.Error;
    @:native("String") function string(): String;

}