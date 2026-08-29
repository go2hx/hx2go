package go.fmt;

/**
    Stringer is implemented by any value that has a String method,
    which defines the “native” format for that value.
    The String method is used to print values passed as an operand
    to any format that accepts a string or to an unformatted printer
    such as [Print].
**/
@:go.Type({ name: "Stringer", instanceName: "fmt.Stringer", imports: ["fmt"] })
extern typedef Stringer = {

    @:native("String") function string(): (String);

}