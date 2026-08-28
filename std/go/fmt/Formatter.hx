package go.fmt;

/**
    Formatter is implemented by any value that has a Format method.
    The implementation controls how [State] and rune are interpreted,
    and may call [Sprint] or [Fprint](f) etc. to generate its output.
**/
@:go.Type({ name: "Formatter", instanceName: "fmt.Formatter", imports: ["fmt"] })
extern typedef Formatter = {

    @:native("Format") function format(f: go.fmt.State, verb: go.Rune): Void;

}