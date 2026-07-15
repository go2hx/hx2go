package go.fmt;

@:go.Type({ name: "Formatter", instanceName: "fmt.Formatter", imports: ["fmt"] })
extern typedef Formatter = {

    @:native("Format") function format(f: go.fmt.State, verb: go.Rune): Void;

}