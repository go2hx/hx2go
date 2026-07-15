package go.internal.xcoff;

@:structInit
@:go.Type({ name: "Member", instanceName: "xcoff.Member", imports: ["internal/xcoff"] })
extern class Member {

    @:native("MemberHeader") var memberHeader: go.internal.xcoff.MemberHeader;

function new(memberHeader: go.internal.xcoff.MemberHeader);

}