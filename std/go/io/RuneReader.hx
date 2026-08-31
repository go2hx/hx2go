package go.io;

/**
    RuneReader is the interface that wraps the ReadRune method.
    
    ReadRune reads a single encoded Unicode character
    and returns the rune and its size in bytes. If no character is
    available, err will be set.
**/
@:go.Type({ name: "RuneReader", instanceName: "io.RuneReader", imports: ["io"] })
extern typedef RuneReader = {

    @:go.Tuple("r", "size", "err") @:native("ReadRune") function readRune(): (go.Tuple<{ r: go.Rune, size: go.GoInt, err: go.Error }>);

}