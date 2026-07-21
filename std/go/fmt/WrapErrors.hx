package go.fmt;

@:structInit
@:go.Type({ name: "wrapErrors", instanceName: "fmt.wrapErrors", imports: ["fmt"] })
extern class WrapErrors {

    @:native("Error") function error(): (String);
    @:native("Unwrap") function unwrap(): (go.Slice<go.Error>);

}