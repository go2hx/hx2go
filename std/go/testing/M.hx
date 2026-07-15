package go.testing;

@:structInit
@:go.Type({ name: "M", instanceName: "testing.M", imports: ["testing"] })
extern class M {

    @:native("Run") function run(): go.GoInt;

}