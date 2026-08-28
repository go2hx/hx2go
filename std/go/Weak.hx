package go;

/**
    Package weak provides ways to safely reference memory weakly,
    that is, without preventing its reclamation.
**/
@:go.Type({ name: "weak", instanceName: "weak.weak", imports: ["weak"] })
extern class Weak {

    /**
        Make creates a weak pointer from a pointer to some value of type T.
    **/
    @:native("Make") static function make<T: Dynamic>(ptr: go.Pointer<T>): (go.weak.Pointer<T>);

}