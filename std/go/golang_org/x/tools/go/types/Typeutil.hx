package go.golang_org.x.tools.go.types;

@:go.Type({ name: "typeutil", instanceName: "typeutil.typeutil", imports: ["golang.org/x/tools/go/types/typeutil"] })
extern class Typeutil {

    @:native("Callee") static function callee(info: go.Pointer<go.go.types.Info>, call: go.Pointer<go.go.ast.CallExpr>): (go.go.types.Object);
    @:native("Dependencies") static function dependencies(pkgs: haxe.Rest<go.Pointer<go.go.types.Package>>): (go.Slice<go.Pointer<go.go.types.Package>>);
    @:native("IntuitiveMethodSet") static function intuitiveMethodSet(T: go.go.types.Type, msets: go.Pointer<go.golang_org.x.tools.go.types.typeutil.MethodSetCache>): (go.Slice<go.Pointer<go.go.types.Selection>>);
    @:native("MakeHasher") static function makeHasher(): (go.golang_org.x.tools.go.types.typeutil.Hasher);
    @:native("StaticCallee") static function staticCallee(info: go.Pointer<go.go.types.Info>, call: go.Pointer<go.go.ast.CallExpr>): (go.Pointer<go.go.types.Func>);

}