package go.internal.profile;

@:structInit
@:go.Type({ name: "Sample", instanceName: "profile.Sample", imports: ["internal/profile"] })
extern class Sample {

    @:native("Location") var location: go.Slice<go.Pointer<go.internal.profile.Location>>;
    @:native("Value") var value: go.Slice<go.Int64>;
    @:native("Label") var label: go.Map<String, go.Slice<String>>;
    @:native("NumLabel") var numLabel: go.Map<String, go.Slice<go.Int64>>;
    @:native("NumUnit") var numUnit: go.Map<String, go.Slice<String>>;

function new(location: go.Slice<go.Pointer<go.internal.profile.Location>>, value: go.Slice<go.Int64>, label: go.Map<String, go.Slice<String>>, numLabel: go.Map<String, go.Slice<go.Int64>>, numUnit: go.Map<String, go.Slice<String>>);

}