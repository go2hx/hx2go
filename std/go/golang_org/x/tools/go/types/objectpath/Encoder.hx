package go.golang_org.x.tools.go.types.objectpath;

@:structInit
@:go.Type({ name: "Encoder", instanceName: "objectpath.Encoder", imports: ["golang.org/x/tools/go/types/objectpath"] })
extern class Encoder {

    @:native("For") function _for(obj: go.go.types.Object): (go.Result<go.golang_org.x.tools.go.types.objectpath.Path>);

}