package go.golang_org.x.tools.go.types;

@:go.Type({ name: "objectpath", instanceName: "objectpath.objectpath", imports: ["golang.org/x/tools/go/types/objectpath"] })
extern class Objectpath {

    @:native("For") static function _for(obj: go.go.types.Object): (go.Result<go.golang_org.x.tools.go.types.objectpath.Path>);
    @:native("Object") static function object(pkg: go.Pointer<go.go.types.Package>, p: go.golang_org.x.tools.go.types.objectpath.Path): (go.Result<go.go.types.Object>);

}