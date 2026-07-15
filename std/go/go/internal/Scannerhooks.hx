package go.go.internal;

@:go.Type({ name: "scannerhooks", instanceName: "scannerhooks.scannerhooks", imports: ["go/internal/scannerhooks"] })
extern class Scannerhooks {

    @:native("StringEnd") static var StringEnd: (scanner: Dynamic) -> go.go.token.Pos;

}