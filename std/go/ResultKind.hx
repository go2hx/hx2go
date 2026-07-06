package go;

enum ResultKind<R, E = Error> {
    Ok(r: R);
    Err(e: E);
}