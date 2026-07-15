package go.internal.profile;

@:go.Type({ name: "NodeMap", instanceName: "profile.NodeMap", imports: ["internal/profile"] })
extern class NodeMap {

    @:native("FindOrInsertNode") function findOrInsertNode(info: go.internal.profile.NodeInfo, kept: go.internal.profile.NodeSet): go.Pointer<go.internal.profile.Node>;

}