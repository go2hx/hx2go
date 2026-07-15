package go.weak;

@:structInit
@:go.Type({ name: "Pointer", instanceName: "weak.Pointer", imports: ["weak"] })
extern class Pointer<T: Dynamic> {

    @:native("Value") function value(): go.Pointer<T>;

}