package go;

@:go.ProcessedType
abstract Result<R, E = Error>(ResultKind<R, E>) from ResultKind<R, E> to ResultKind<R, E> {

    @:op(a!)
    public inline extern function sure(): R { // must be forced inline
        return switch this {
            case Ok(r): r;
            case Err(e): throw e; null;
        }
    }

    public inline extern function tuple(): Tuple<{ result: R, error: E }> { // must be forced inline
        return cast this;
    }

}
