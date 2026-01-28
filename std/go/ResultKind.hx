package go;

@:go.ProcessedType
enum ResultKind<R, E = Error> {
    Ok(r: R);
    Err(e: E);
}
