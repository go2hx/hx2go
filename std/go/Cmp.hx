package go;

@:go.Type({ name: "cmp", instanceName: "cmp.cmp", imports: ["cmp"] })
extern class Cmp {

    @:native("Compare") static function compare<T: go.cmp.Ordered>(x: T, y: T): (go.GoInt);
    @:native("Less") static function less<T: go.cmp.Ordered>(x: T, y: T): (Bool);
    @:native("Or") static function or<T: go.Comparable>(vals: haxe.Rest<T>): (T);

}