package go.golang_org.x.tools.go.packages.gopackages;

@:go.Type({ name: "stringListValue", instanceName: "main.stringListValue", imports: ["golang.org/x/tools/go/packages/gopackages"] })
extern class StringListValue {

    @:native("Get") function get(): (Dynamic);
    @:native("Set") function set(s: String): (go.Error);
    @:native("String") function string(): (String);

}