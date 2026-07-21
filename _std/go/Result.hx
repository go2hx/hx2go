package go;

@:go.AbstractNoGenericErasure
abstract Result<R, E = Error>(ResultKind<R, E>) from ResultKind<R, E> to ResultKind<R, E> {

    @:op(a!)
    public inline extern function sure(): R { // must be forced inline
        return switch this {
            case Ok(r): r;
            case Err(e): throw e;
        }
    }

    @:op(a || b)
    public inline extern function or(v: R): R {
        return switch this {
            case Ok(r): r;
            case Err(_): v;
        }
    }

    public inline extern function isOk(): Bool {
        return switch this {
            case Ok(_): true;
            case Err(_): false;
        }
    }

    @:go.Tuple("result", "error")
    public inline extern function tuple(): Tuple<{ result: R, error: E }> { // must be forced inline
        return cast this;
    }

}