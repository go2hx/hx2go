package go;

// A send-only channel (`chan<- T`). Distinct abstract (not a typedef) for the
// same reason as ReceiveChan: the direction must survive into the typed AST.
@:coreType
@:runtimeValue
abstract SendChan<T> {
    // A bidirectional channel is usable as send-only (Go assigns chan T -> chan<- T).
    @:from public static inline function fromChan<T>(c: Chan<T>): SendChan<T> {
        return Syntax.code("{0}", (c : Chan<T>));
    }
}
