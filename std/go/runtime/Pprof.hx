package go.runtime;

/**
    Package pprof writes runtime profiling data in the format expected
    by the pprof visualization tool.
    
    # Profiling a Go program
    
    The first step to profiling a Go program is to enable profiling.
    Support for profiling benchmarks built with the standard testing
    package is built into go test. For example, the following command
    runs benchmarks in the current directory and writes the CPU and
    memory profiles to cpu.prof and mem.prof:
    
    	go test -cpuprofile cpu.prof -memprofile mem.prof -bench .
    
    To add equivalent profiling support to a standalone program, add
    code like the following to your main function:
    
    	var cpuprofile = flag.String("cpuprofile", "", "write cpu profile to `file`")
    	var memprofile = flag.String("memprofile", "", "write memory profile to `file`")
    
    	func main() {
    	    flag.Parse()
    	    if *cpuprofile != "" {
    	        f, err := os.Create(*cpuprofile)
    	        if err != nil {
    	            log.Fatal("could not create CPU profile: ", err)
    	        }
    	        defer f.Close() // error handling omitted for example
    	        if err := pprof.StartCPUProfile(f); err != nil {
    	            log.Fatal("could not start CPU profile: ", err)
    	        }
    	        defer pprof.StopCPUProfile()
    	    }
    
    	    // ... rest of the program ...
    
    	    if *memprofile != "" {
    	        f, err := os.Create(*memprofile)
    	        if err != nil {
    	            log.Fatal("could not create memory profile: ", err)
    	        }
    	        defer f.Close() // error handling omitted for example
    	        runtime.GC() // get up-to-date statistics
    	        // Lookup("allocs") creates a profile similar to go test -memprofile.
    	        // Alternatively, use Lookup("heap") for a profile
    	        // that has inuse_space as the default index.
    	        if err := pprof.Lookup("allocs").WriteTo(f, 0); err != nil {
    	            log.Fatal("could not write memory profile: ", err)
    	        }
    	    }
    	}
    
    There is also a standard HTTP interface to profiling data. Adding
    the following line will install handlers under the /debug/pprof/
    URL to download live profiles:
    
    	import _ "net/http/pprof"
    
    See the net/http/pprof package for more details.
    
    Profiles can then be visualized with the pprof tool:
    
    	go tool pprof cpu.prof
    
    There are many commands available from the pprof command line.
    Commonly used commands include "top", which prints a summary of the
    top program hot-spots, and "web", which opens an interactive graph
    of hot-spots and their call graphs. Use "help" for information on
    all pprof commands.
    
    For more information about pprof, see
    https://github.com/google/pprof/blob/main/doc/README.md.
**/
@:go.Type({ name: "pprof", instanceName: "pprof.pprof", imports: ["runtime/pprof"] })
extern class Pprof {

    /**
        Do calls f with a copy of the parent context with the
        given labels added to the parent's label map.
        Goroutines spawned while executing f will inherit the augmented label-set.
        Each key/value pair in labels is inserted into the label map in the
        order provided, overriding any previous value for the same key.
        The augmented label map will be set for the duration of the call to f
        and restored once f returns.
    **/
    @:native("Do") static function _do(ctx: go.context.Context, labels: go.runtime.pprof.LabelSet, f: (p0: go.context.Context) -> Void): Void;
    /**
        ForLabels invokes f with each label set on the context.
        The function f should return true to continue iteration or false to stop iteration early.
    **/
    @:native("ForLabels") static function forLabels(ctx: go.context.Context, f: (key: String, value: String) -> (Bool)): Void;
    /**
        Label returns the value of the label with the given key on ctx, and a boolean indicating
        whether that label exists.
    **/
    @:go.Tuple("p0", "p1") @:native("Label") static function label(ctx: go.context.Context, key: String): (go.Tuple<{ p0: String, p1: Bool }>);
    /**
        Labels takes an even number of strings representing key-value pairs
        and makes a [LabelSet] containing them.
        A label overwrites a prior label with the same key.
        Currently only the CPU and goroutine profiles utilize any labels
        information.
        See https://golang.org/issue/23458 for details.
    **/
    @:native("Labels") static function labels(args: haxe.Rest<String>): (go.runtime.pprof.LabelSet);
    /**
        Lookup returns the profile with the given name, or nil if no such profile exists.
    **/
    @:native("Lookup") static function lookup(name: String): (go.Pointer<go.runtime.pprof.Profile>);
    /**
        NewProfile creates a new profile with the given name.
        If a profile with that name already exists, NewProfile panics.
        The convention is to use a 'import/path.' prefix to create
        separate name spaces for each package.
        For compatibility with various tools that read pprof data,
        profile names should not contain spaces.
    **/
    @:native("NewProfile") static function newProfile(name: String): (go.Pointer<go.runtime.pprof.Profile>);
    /**
        Profiles returns a slice of all the known profiles, sorted by name.
    **/
    @:native("Profiles") static function profiles(): (go.Slice<go.Pointer<go.runtime.pprof.Profile>>);
    /**
        SetGoroutineLabels sets the current goroutine's labels to match ctx.
        A new goroutine inherits the labels of the goroutine that created it.
        This is a lower-level API than [Do], which should be used instead when possible.
    **/
    @:native("SetGoroutineLabels") static function setGoroutineLabels(ctx: go.context.Context): Void;
    /**
        StartCPUProfile enables CPU profiling for the current process.
        While profiling, the profile will be buffered and written to w.
        StartCPUProfile returns an error if profiling is already enabled.
        
        On Unix-like systems, StartCPUProfile does not work by default for
        Go code built with -buildmode=c-archive or -buildmode=c-shared.
        StartCPUProfile relies on the SIGPROF signal, but that signal will
        be delivered to the main program's SIGPROF signal handler (if any)
        not to the one used by Go. To make it work, call [os/signal.Notify]
        for [syscall.SIGPROF], but note that doing so may break any profiling
        being done by the main program.
    **/
    @:native("StartCPUProfile") static function startCPUProfile(w: go.io.Writer): (go.Error);
    /**
        StopCPUProfile stops the current CPU profile, if any.
        StopCPUProfile only returns after all the writes for the
        profile have completed.
    **/
    @:native("StopCPUProfile") static function stopCPUProfile(): Void;
    /**
        WithLabels returns a new [context.Context] with the given labels added.
        A label overwrites a prior label with the same key.
    **/
    @:native("WithLabels") static function withLabels(ctx: go.context.Context, labels: go.runtime.pprof.LabelSet): (go.context.Context);
    /**
        WriteHeapProfile is shorthand for [Lookup]("heap").WriteTo(w, 0).
        It is preserved for backwards compatibility.
    **/
    @:native("WriteHeapProfile") static function writeHeapProfile(w: go.io.Writer): (go.Error);

}