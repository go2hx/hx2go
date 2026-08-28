package go.fmt;

/**
    GoStringer is implemented by any value that has a GoString method,
    which defines the Go syntax for that value.
    The GoString method is used to print values passed as an operand
    to a %#v format.
**/
@:go.Type({ name: "GoStringer", instanceName: "fmt.GoStringer", imports: ["fmt"] })
extern typedef GoStringer = {

    @:native("GoString") function goString(): (String);

}