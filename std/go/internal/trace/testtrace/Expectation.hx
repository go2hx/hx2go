package go.internal.trace.testtrace;

@:structInit
@:go.Type({ name: "Expectation", instanceName: "testtrace.Expectation", imports: ["internal/trace/testtrace"] })
extern class Expectation {

    @:native("Check") function check(err: go.Error): go.Error;

}