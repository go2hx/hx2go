package go.internal.profile;

@:go.Type({ name: "Nodes", instanceName: "profile.Nodes", imports: ["internal/profile"] })
extern class Nodes {

    @:go.Tuple("flat", "cum") @:native("Sum") function sum(): go.Tuple<{ flat: go.Int64, cum: go.Int64 }>;

}