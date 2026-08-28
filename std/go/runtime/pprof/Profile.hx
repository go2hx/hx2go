package go.runtime.pprof;

/**
    A Profile is a collection of stack traces showing the call sequences
    that led to instances of a particular event, such as allocation.
    Packages can create and maintain their own profiles; the most common
    use is for tracking resources that must be explicitly closed, such as files
    or network connections.
    
    A Profile's methods can be called from multiple goroutines simultaneously.
    
    Each Profile has a unique name. A few profiles are predefined:
    
    	goroutine      - stack traces of all current goroutines
    	goroutineleak  - stack traces of all leaked goroutines
    	allocs         - a sampling of all past memory allocations
    	heap           - a sampling of memory allocations of live objects
    	threadcreate   - stack traces that led to the creation of new OS threads
    	block          - stack traces that led to blocking on synchronization primitives
    	mutex          - stack traces of holders of contended mutexes
    
    These predefined profiles maintain themselves and panic on an explicit
    [Profile.Add] or [Profile.Remove] method call.
    
    The CPU profile is not available as a Profile. It has a special API,
    the [StartCPUProfile] and [StopCPUProfile] functions, because it streams
    output to a writer during profiling.
    
    # Heap profile
    
    The heap profile reports statistics as of the most recently completed
    garbage collection; it elides more recent allocation to avoid skewing
    the profile away from live data and toward garbage.
    If there has been no garbage collection at all, the heap profile reports
    all known allocations. This exception helps mainly in programs running
    without garbage collection enabled, usually for debugging purposes.
    
    The heap profile tracks both the allocation sites for all live objects in
    the application memory and for all objects allocated since the program start.
    Pprof's -inuse_space, -inuse_objects, -alloc_space, and -alloc_objects
    flags select which to display, defaulting to -inuse_space (live objects,
    scaled by size).
    
    # Allocs profile
    
    The allocs profile is the same as the heap profile but changes the default
    pprof display to -alloc_space, the total number of bytes allocated since
    the program began (including garbage-collected bytes).
    
    # Block profile
    
    The block profile tracks time spent blocked on synchronization primitives,
    such as [sync.Mutex], [sync.RWMutex], [sync.WaitGroup], [sync.Cond], and
    channel send/receive/select.
    
    Stack traces correspond to the location that blocked (for example,
    [sync.Mutex.Lock]).
    
    Sample values correspond to cumulative time spent blocked at that stack
    trace, subject to time-based sampling specified by
    [runtime.SetBlockProfileRate].
    
    # Mutex profile
    
    The mutex profile tracks contention on mutexes, such as [sync.Mutex],
    [sync.RWMutex], and runtime-internal locks.
    
    Stack traces correspond to the end of the critical section causing
    contention. For example, a lock held for a long time while other goroutines
    are waiting to acquire the lock will report contention when the lock is
    finally unlocked (that is, at [sync.Mutex.Unlock]).
    
    Sample values correspond to the approximate cumulative time other goroutines
    spent blocked waiting for the lock, subject to event-based sampling
    specified by [runtime.SetMutexProfileFraction]. For example, if a caller
    holds a lock for 1s while 5 other goroutines are waiting for the entire
    second to acquire the lock, its unlock call stack will report 5s of
    contention.
**/
@:structInit
@:go.Type({ name: "Profile", instanceName: "pprof.Profile", imports: ["runtime/pprof"] })
extern class Profile {

    /**
        Add adds the current execution stack to the profile, associated with value.
        Add stores value in an internal map, so value must be suitable for use as
        a map key and will not be garbage collected until the corresponding
        call to [Profile.Remove]. Add panics if the profile already contains a stack for value.
        
        The skip parameter has the same meaning as [runtime.Caller]'s skip
        and controls where the stack trace begins. Passing skip=0 begins the
        trace in the function calling Add. For example, given this
        execution stack:
        
        	Add
        	called from rpc.NewClient
        	called from mypkg.Run
        	called from main.main
        
        Passing skip=0 begins the stack trace at the call to Add inside rpc.NewClient.
        Passing skip=1 begins the stack trace at the call to NewClient inside mypkg.Run.
    **/
    @:native("Add") function add(value: Dynamic, skip: go.GoInt): Void;
    /**
        Count returns the number of execution stacks currently in the profile.
    **/
    @:native("Count") function count(): (go.GoInt);
    /**
        Name returns this profile's name, which can be passed to [Lookup] to reobtain the profile.
    **/
    @:native("Name") function name(): (String);
    /**
        Remove removes the execution stack associated with value from the profile.
        It is a no-op if the value is not in the profile.
    **/
    @:native("Remove") function remove(value: Dynamic): Void;
    /**
        WriteTo writes a pprof-formatted snapshot of the profile to w.
        If a write to w returns an error, WriteTo returns that error.
        Otherwise, WriteTo returns nil.
        
        The debug parameter enables additional output.
        Passing debug=0 writes the gzip-compressed protocol buffer described
        in https://github.com/google/pprof/tree/main/proto#overview.
        Passing debug=1 writes the legacy text format with comments
        translating addresses to function names and line numbers, so that a
        programmer can read the profile without tools.
        
        The predefined profiles may assign meaning to other debug values;
        for example, when printing the "goroutine" profile, debug=2 means to
        print the goroutine stacks in the same form that a Go program uses
        when dying due to an unrecovered panic.
    **/
    @:native("WriteTo") function writeTo(w: go.io.Writer, debug: go.GoInt): (go.Error);

}