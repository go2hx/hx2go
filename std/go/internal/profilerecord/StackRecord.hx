package go.internal.profilerecord;

@:structInit
@:go.Type({ name: "StackRecord", instanceName: "profilerecord.StackRecord", imports: ["internal/profilerecord"] })
extern class StackRecord {

    @:native("Stack") var stack: go.Slice<go.UIntPtr>;

function new(stack: go.Slice<go.UIntPtr>);

}