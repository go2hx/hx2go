package go.fmt;

/**
    Scanner is implemented by any value that has a Scan method, which scans
    the input for the representation of a value and stores the result in the
    receiver, which must be a pointer to be useful. The Scan method is called
    for any argument to [Scan], [Scanf], or [Scanln] that implements it.
**/
@:go.Type({ name: "Scanner", instanceName: "fmt.Scanner", imports: ["fmt"] })
extern typedef Scanner = {

    @:native("Scan") function scan(state: go.fmt.ScanState, verb: go.Rune): (go.Error);

}