package go;

@:go.ProcessedType
@:go.NativeCast
enum ResultKind<R, E = Error> {
    Ok(r: R);
    Err(e: E);
}
