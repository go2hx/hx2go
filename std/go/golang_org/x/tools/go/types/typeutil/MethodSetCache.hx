package go.golang_org.x.tools.go.types.typeutil;

@:structInit
@:go.Type({ name: "MethodSetCache", instanceName: "typeutil.MethodSetCache", imports: ["golang.org/x/tools/go/types/typeutil"] })
extern class MethodSetCache {

    @:native("MethodSet") function methodSet(T: go.go.types.Type): (go.Pointer<go.go.types.MethodSet>);

}