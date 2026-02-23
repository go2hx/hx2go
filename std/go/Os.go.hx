package go;

// https://pkg.go.dev/os
@:go.TypeAccess({name: "os", imports: ["os"]})
extern class Os {
	static function exit(code:GoInt):Void;
}
