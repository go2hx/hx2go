package go.golang_org.x.tools.go.types.objectpath;

/**
    A Path is an opaque name that identifies a types.Object
    relative to its package. Conceptually, the name consists of a
    sequence of destructuring operations applied to the package scope
    to obtain the original object.
    The name does not include the package itself.
**/
@:go.Type({ name: "Path", instanceName: "objectpath.Path", imports: ["golang.org/x/tools/go/types/objectpath"] })
extern typedef Path = String