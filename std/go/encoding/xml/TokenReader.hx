package go.encoding.xml;

/**
    A TokenReader is anything that can decode a stream of XML tokens, including a
    [Decoder].
    
    When Token encounters an error or end-of-file condition after successfully
    reading a token, it returns the token. It may return the (non-nil) error from
    the same call or return the error (and a nil token) from a subsequent call.
    An instance of this general case is that a TokenReader returning a non-nil
    token at the end of the token stream may return either io.EOF or a nil error.
    The next Read should return nil, [io.EOF].
    
    Implementations of Token are discouraged from returning a nil token with a
    nil error. Callers should treat a return of nil, nil as indicating that
    nothing happened; in particular it does not indicate EOF.
**/
@:go.Type({ name: "TokenReader", instanceName: "xml.TokenReader", imports: ["encoding/xml"] })
extern typedef TokenReader = {

    @:native("Token") function token(): (go.Result<go.encoding.xml.Token>);

}