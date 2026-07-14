package go;

// A receive-only channel (`<-chan T`). Distinct abstract (not a typedef) so the
// direction survives into the typed AST and reaches TypeWriter; a transparent
// typedef would collapse back to Chan and emit a bidirectional `chan`.
@:coreType
@:runtimeValue
abstract ReceiveChan<T> {
    // A bidirectional channel is usable as receive-only (Go assigns chan T -> <-chan T).
    @:from public static inline function fromChan<T>(c: Chan<T>): ReceiveChan<T> {
        return Syntax.code("{0}", (c : Chan<T>));
    }
}
