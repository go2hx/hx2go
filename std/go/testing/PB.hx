package go.testing;

/**
    A PB is used by RunParallel for running parallel benchmarks.
**/
@:structInit
@:go.Type({ name: "PB", instanceName: "testing.PB", imports: ["testing"] })
extern class PB {

    /**
        Next reports whether there are more iterations to execute.
    **/
    @:native("Next") function next(): (Bool);

}