package go.testing;

@:structInit
@:go.Type({ name: "durationOrCountFlag", instanceName: "testing.durationOrCountFlag", imports: ["testing"] })
extern class DurationOrCountFlag {

    @:native("Set") function set(s: String): (go.Error);
    @:native("String") function string(): (String);

}