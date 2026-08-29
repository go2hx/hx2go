package go.testing;

/**
    B is a type passed to [Benchmark] functions to manage benchmark
    timing and control the number of iterations.
    
    A benchmark ends when its Benchmark function returns or calls any of the methods
    [B.FailNow], [B.Fatal], [B.Fatalf], [B.SkipNow], [B.Skip], or [B.Skipf].
    Those methods must be called only from the goroutine running the Benchmark function.
    The other reporting methods, such as the variations of [B.Log] and [B.Error],
    may be called simultaneously from multiple goroutines.
    
    Like in tests, benchmark logs are accumulated during execution
    and dumped to standard output when done. Unlike in tests, benchmark logs
    are always printed, so as not to hide output whose existence may be
    affecting benchmark results.
**/
@:structInit
@:go.Type({ name: "B", instanceName: "testing.B", imports: ["testing"] })
extern class B {

    @:native("N") var N: go.GoInt;

    function new(N: go.GoInt=0);

    /**
        ArtifactDir returns a directory in which the test should store output files.
        When the -artifacts flag is provided, this directory is located
        under the output directory. Otherwise, ArtifactDir returns a temporary directory
        that is removed after the test completes.
        
        Each test or subtest within each test package has a unique artifact directory.
        Repeated calls to ArtifactDir in the same test or subtest return the same directory.
        Subtest outputs are not located under the parent test's output directory.
    **/
    @:native("ArtifactDir") function artifactDir(): (String);
    /**
        Attr emits a test attribute associated with this test.
        
        The key must not contain whitespace.
        The value must not contain newlines or carriage returns.
        
        The meaning of different attribute keys is left up to
        continuous integration systems and test frameworks.
        
        Test attributes are emitted immediately in the test log,
        but they are intended to be treated as unordered.
    **/
    @:native("Attr") function attr(key: String, value: String): Void;
    /**
        Chdir calls [os.Chdir] and uses Cleanup to restore the current
        working directory to its original value after the test. On Unix, it
        also sets PWD environment variable for the duration of the test.
        
        Because Chdir affects the whole process, it cannot be used
        in parallel tests or tests with parallel ancestors.
    **/
    @:native("Chdir") function chdir(dir: String): Void;
    /**
        Cleanup registers a function to be called when the test (or subtest) and all its
        subtests complete. Cleanup functions will be called in last added,
        first called order.
    **/
    @:native("Cleanup") function cleanup(f: () -> Void): Void;
    /**
        Context returns a context that is canceled just before
        Cleanup-registered functions are called.
        
        Cleanup functions can wait for any resources
        that shut down on [context.Context.Done] before the test or benchmark completes.
    **/
    @:native("Context") function context(): (go.context.Context);
    /**
        Elapsed returns the measured elapsed time of the benchmark.
        The duration reported by Elapsed matches the one measured by
        [B.StartTimer], [B.StopTimer], and [B.ResetTimer].
    **/
    @:native("Elapsed") function elapsed(): (go.time.Duration);
    /**
        Error is equivalent to Log followed by Fail.
    **/
    @:native("Error") function error(args: haxe.Rest<Dynamic>): Void;
    /**
        Errorf is equivalent to Logf followed by Fail.
    **/
    @:native("Errorf") function errorf(format: String, args: haxe.Rest<Dynamic>): Void;
    /**
        Fail marks the function as having failed but continues execution.
    **/
    @:native("Fail") function fail(): Void;
    /**
        FailNow marks the function as having failed and stops its execution
        by calling [runtime.Goexit] (which then runs all deferred calls in the
        current goroutine).
        Execution will continue at the next test or benchmark.
        FailNow must be called from the goroutine running the
        test or benchmark function, not from other goroutines
        created during the test. Calling FailNow does not stop
        those other goroutines.
    **/
    @:native("FailNow") function failNow(): Void;
    /**
        Failed reports whether the function has failed.
    **/
    @:native("Failed") function failed(): (Bool);
    /**
        Fatal is equivalent to Log followed by FailNow.
    **/
    @:native("Fatal") function fatal(args: haxe.Rest<Dynamic>): Void;
    /**
        Fatalf is equivalent to Logf followed by FailNow.
    **/
    @:native("Fatalf") function fatalf(format: String, args: haxe.Rest<Dynamic>): Void;
    /**
        Helper marks the calling function as a test helper function.
        When printing file and line information, that function will be skipped.
        Helper may be called simultaneously from multiple goroutines.
    **/
    @:native("Helper") function helper(): Void;
    /**
        Log formats its arguments using default formatting, analogous to [fmt.Println],
        and records the text in the error log. For tests, the text will be printed only if
        the test fails or the -test.v flag is set. For benchmarks, the text is always
        printed to avoid having performance depend on the value of the -test.v flag.
        It is an error to call Log after a test or benchmark returns.
    **/
    @:native("Log") function log(args: haxe.Rest<Dynamic>): Void;
    /**
        Logf formats its arguments according to the format, analogous to [fmt.Printf], and
        records the text in the error log. A final newline is added if not provided. For
        tests, the text will be printed only if the test fails or the -test.v flag is
        set. For benchmarks, the text is always printed to avoid having performance
        depend on the value of the -test.v flag.
        It is an error to call Logf after a test or benchmark returns.
    **/
    @:native("Logf") function logf(format: String, args: haxe.Rest<Dynamic>): Void;
    /**
        Loop returns true as long as the benchmark should continue running.
        
        A typical benchmark is structured like:
        
        	func Benchmark(b *testing.B) {
        		... setup ...
        		for b.Loop() {
        			... code to measure ...
        		}
        		... cleanup ...
        	}
        
        Loop resets the benchmark timer the first time it is called in a benchmark,
        so any setup performed prior to starting the benchmark loop does not count
        toward the benchmark measurement. Likewise, when it returns false, it stops
        the timer so cleanup code is not measured.
        
        Within the body of a "for b.Loop() { ... }" loop, arguments to and
        results from function calls and assigned variables within the loop are kept
        alive, preventing the compiler from fully optimizing away the loop body.
        Currently, this is implemented as a compiler transformation that wraps such
        variables with a runtime.KeepAlive intrinsic call. This applies only to
        statements syntactically between the curly braces of the loop, and the loop
        condition must be written exactly as "b.Loop()".
        
        After Loop returns false, b.N contains the total number of iterations that
        ran, so the benchmark may use b.N to compute other average metrics.
        
        Prior to the introduction of Loop, benchmarks were expected to contain an
        explicit loop from 0 to b.N. Benchmarks should either use Loop or contain a
        loop to b.N, but not both. Loop offers more automatic management of the
        benchmark timer, and runs each benchmark function only once per measurement,
        whereas b.N-based benchmarks must run the benchmark function (and any
        associated setup and cleanup) several times.
    **/
    @:native("Loop") function loop(): (Bool);
    /**
        Name returns the name of the running (sub-) test or benchmark.
        
        The name will include the name of the test along with the names of
        any nested sub-tests. If two sibling sub-tests have the same name,
        Name will append a suffix to guarantee the returned name is unique.
    **/
    @:native("Name") function name(): (String);
    /**
        Output returns a Writer that writes to the same test output stream as TB.Log.
        The output is indented like TB.Log lines, but Output does not
        add source locations or newlines. The output is internally line
        buffered, and a call to TB.Log or the end of the test will implicitly
        flush the buffer, followed by a newline. After a test function and all its
        parents return, neither Output nor the Write method may be called.
    **/
    @:native("Output") function output(): (go.io.Writer);
    /**
        ReportAllocs enables malloc statistics for this benchmark.
        It is equivalent to setting -test.benchmem, but it only affects the
        benchmark function that calls ReportAllocs.
    **/
    @:native("ReportAllocs") function reportAllocs(): Void;
    /**
        ReportMetric adds "n unit" to the reported benchmark results.
        If the metric is per-iteration, the caller should divide by b.N,
        and by convention units should end in "/op".
        ReportMetric overrides any previously reported value for the same unit.
        ReportMetric panics if unit is the empty string or if unit contains
        any whitespace.
        If unit is a unit normally reported by the benchmark framework itself
        (such as "allocs/op"), ReportMetric will override that metric.
        Setting "ns/op" to 0 will suppress that built-in metric.
    **/
    @:native("ReportMetric") function reportMetric(n: Float, unit: String): Void;
    /**
        ResetTimer zeroes the elapsed benchmark time and memory allocation counters
        and deletes user-reported metrics.
        It does not affect whether the timer is running.
    **/
    @:native("ResetTimer") function resetTimer(): Void;
    /**
        Run benchmarks f as a subbenchmark with the given name. It reports
        whether there were any failures.
        
        A subbenchmark is like any other benchmark. A benchmark that calls Run at
        least once will not be measured itself and will be called once with N=1.
    **/
    @:native("Run") function run(name: String, f: (b: go.Pointer<go.testing.B>) -> Void): (Bool);
    /**
        RunParallel runs a benchmark in parallel.
        It creates multiple goroutines and distributes b.N iterations among them.
        The number of goroutines defaults to GOMAXPROCS. To increase parallelism for
        non-CPU-bound benchmarks, call [B.SetParallelism] before RunParallel.
        RunParallel is usually used with the go test -cpu flag.
        
        The body function will be run in each goroutine. It should set up any
        goroutine-local state and then iterate until pb.Next returns false.
        It should not use the [B.StartTimer], [B.StopTimer], or [B.ResetTimer] functions,
        because they have global effect. It should also not call [B.Run].
        
        RunParallel reports ns/op values as wall time for the benchmark as a whole,
        not the sum of wall time or CPU time over each parallel goroutine.
    **/
    @:native("RunParallel") function runParallel(body: (p0: go.Pointer<go.testing.PB>) -> Void): Void;
    /**
        SetBytes records the number of bytes processed in a single operation.
        If this is called, the benchmark will report ns/op and MB/s.
    **/
    @:native("SetBytes") function setBytes(n: go.Int64): Void;
    /**
        SetParallelism sets the number of goroutines used by [B.RunParallel] to p*GOMAXPROCS.
        There is usually no need to call SetParallelism for CPU-bound benchmarks.
        If p is less than 1, this call will have no effect.
    **/
    @:native("SetParallelism") function setParallelism(p: go.GoInt): Void;
    /**
        Setenv calls [os.Setenv] and uses Cleanup to
        restore the environment variable to its original value
        after the test.
        
        Because Setenv affects the whole process, it cannot be used
        in parallel tests or tests with parallel ancestors.
    **/
    @:native("Setenv") function setenv(key: String, value: String): Void;
    /**
        Skip is equivalent to Log followed by SkipNow.
    **/
    @:native("Skip") function skip(args: haxe.Rest<Dynamic>): Void;
    /**
        SkipNow marks the test as having been skipped and stops its execution
        by calling [runtime.Goexit].
        If a test fails (see Error, Errorf, Fail) and is then skipped,
        it is still considered to have failed.
        Execution will continue at the next test or benchmark. See also FailNow.
        SkipNow must be called from the goroutine running the test, not from
        other goroutines created during the test. Calling SkipNow does not stop
        those other goroutines.
    **/
    @:native("SkipNow") function skipNow(): Void;
    /**
        Skipf is equivalent to Logf followed by SkipNow.
    **/
    @:native("Skipf") function skipf(format: String, args: haxe.Rest<Dynamic>): Void;
    /**
        Skipped reports whether the test was skipped.
    **/
    @:native("Skipped") function skipped(): (Bool);
    /**
        StartTimer starts timing a test. This function is called automatically
        before a benchmark starts, but it can also be used to resume timing after
        a call to [B.StopTimer].
    **/
    @:native("StartTimer") function startTimer(): Void;
    /**
        StopTimer stops timing a test. This can be used to pause the timer
        while performing steps that you don't want to measure.
    **/
    @:native("StopTimer") function stopTimer(): Void;
    /**
        TempDir returns a temporary directory for the test to use.
        The directory is automatically removed when the test and
        all its subtests complete.
        Each subsequent call to TempDir returns a unique directory;
        if the directory creation fails, TempDir terminates the test by calling Fatal.
        If the environment variable GOTMPDIR is set, the temporary directory will
        be created somewhere beneath it.
    **/
    @:native("TempDir") function tempDir(): (String);

}