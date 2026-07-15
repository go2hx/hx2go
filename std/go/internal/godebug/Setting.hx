package go.internal.godebug;

@:structInit
@:go.Type({ name: "Setting", instanceName: "godebug.Setting", imports: ["internal/godebug"] })
extern class Setting {

    @:native("IncNonDefault") function incNonDefault(): Void;
    @:native("Name") function name(): String;
    @:native("String") function string(): String;
    @:native("Undocumented") function undocumented(): Bool;
    @:native("Value") function value(): String;

}