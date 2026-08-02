package go.go.token;

@:go.Type({ name: "Pos", instanceName: "token.Pos", imports: ["go/token"] })
extern typedef Pos = haxe.extern.EitherType<go.GoInt, {
    @:native("IsValid") function isValid(): (Bool);

}>