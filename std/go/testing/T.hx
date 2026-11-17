package go.testing;

/**
    T is a type passed to Test functions to manage test state and support formatted test logs.
    
    A test ends when its Test function returns or calls any of the methods
    [T.FailNow], [T.Fatal], [T.Fatalf], [T.SkipNow], [T.Skip], or [T.Skipf]. Those methods, as well as
    the [T.Parallel] method, must be called only from the goroutine running the
    Test function.
    
    The other reporting methods, such as the variations of [T.Log] and [T.Error],
    may be called simultaneously from multiple goroutines.
**/
@:structInit
@:go.Type({ name: "T", instanceName: "testing.T", imports: ["testing"] })
extern class T {

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
        Deadline reports the time at which the test binary will have
        exceeded the timeout specified by the -timeout flag.
        
        The ok result is false if the -timeout flag indicates “no timeout” (0).
    **/
    @:go.Tuple("deadline", "ok") @:native("Deadline") function deadline(): (go.Tuple<{ deadline: go.time.Time, ok: Bool }>);
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
        Parallel signals that this test is to be run in parallel with (and only with)
        other parallel tests. When a test is run multiple times due to use of
        -test.count or -test.cpu, multiple instances of a single test never run in
        parallel with each other.
    **/
    @:native("Parallel") function parallel(): Void;
    /**
        Run runs f as a subtest of t called name. It runs f in a separate goroutine
        and blocks until f returns or calls t.Parallel to become a parallel test.
        Run reports whether f succeeded (or at least did not fail before calling t.Parallel).
        
        Run may be called simultaneously from multiple goroutines, but all such calls
        must return before the outer test function for t returns.
    **/
    @:native("Run") function run(name: String, f: (t: go.Pointer<go.testing.T>) -> Void): (Bool);
    /**
        Setenv calls os.Setenv(key, value) and uses Cleanup to
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