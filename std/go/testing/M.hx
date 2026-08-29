package go.testing;

/**
    M is a type passed to a TestMain function to run the actual tests.
**/
@:structInit
@:go.Type({ name: "M", instanceName: "testing.M", imports: ["testing"] })
extern class M {

    /**
        Run runs the tests. It returns an exit code to pass to os.Exit.
        The exit code is zero when all tests pass, and non-zero for any kind
        of failure. For machine readable test results, parse the output of
        'go test -json'.
    **/
    @:native("Run") function run(): (go.GoInt);

}