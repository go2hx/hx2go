package go.fmt;

@:go.Type({ name: "Scanner", instanceName: "fmt.Scanner", imports: ["fmt"] })
extern typedef Scanner = {

    @:native("Scan") function scan(state: go.fmt.ScanState, verb: go.Rune): (go.Error);

}