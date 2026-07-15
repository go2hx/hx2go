package go.internal.profile;

@:structInit
@:go.Type({ name: "ValueType", instanceName: "profile.ValueType", imports: ["internal/profile"] })
extern class ValueType {

    @:native("Type") var type: String;
    @:native("Unit") var unit: String;

function new(type: String, unit: String);

}