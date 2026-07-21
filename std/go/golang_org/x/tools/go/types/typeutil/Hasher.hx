package go.golang_org.x.tools.go.types.typeutil;

@:structInit
@:go.Type({ name: "Hasher", instanceName: "typeutil.Hasher", imports: ["golang.org/x/tools/go/types/typeutil"] })
extern class Hasher {

    @:native("Hash") function hash(t: go.go.types.Type): (go.UInt32);

}