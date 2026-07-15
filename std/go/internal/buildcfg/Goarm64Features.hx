package go.internal.buildcfg;

@:structInit
@:go.Type({ name: "Goarm64Features", instanceName: "buildcfg.Goarm64Features", imports: ["internal/buildcfg"] })
extern class Goarm64Features {

    @:native("Version") var version: String;
    @:native("LSE") var LSE: Bool;
    @:native("Crypto") var crypto: Bool;

function new(version: String, LSE: Bool, crypto: Bool);

    @:native("String") function string(): String;
    @:native("Supports") function supports(s: String): Bool;

}