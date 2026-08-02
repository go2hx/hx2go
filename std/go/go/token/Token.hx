package go.go.token;

@:go.Type({ name: "Token", instanceName: "token.Token", imports: ["go/token"] })
extern typedef Token = haxe.extern.EitherType<go.GoInt, {
    @:native("IsKeyword") function isKeyword(): (Bool);
    @:native("IsLiteral") function isLiteral(): (Bool);
    @:native("IsOperator") function isOperator(): (Bool);
    @:native("Precedence") function precedence(): (go.GoInt);
    @:native("String") function string(): (String);

}>