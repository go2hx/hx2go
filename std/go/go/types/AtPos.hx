package go.go.types;

@:go.Type({ name: "atPos", instanceName: "types.atPos", imports: ["go/types"] })
extern typedef AtPos = haxe.extern.EitherType<go.GoInt, {
    @:native("Pos") function pos(): (go.go.token.Pos);

}>