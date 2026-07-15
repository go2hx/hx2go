package go.io;

@:go.Type({ name: "RuneReader", instanceName: "io.RuneReader", imports: ["io"] })
extern typedef RuneReader = {

    @:go.Tuple("r", "size", "err") @:native("ReadRune") function readRune(): go.Tuple<{ r: go.Rune, size: go.GoInt, err: go.Error }>;

}