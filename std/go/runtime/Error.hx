package go.runtime;

/**
    Error identifies a runtime error used in panic.
    
    The Go runtime triggers panics for a variety of cases, as described by the
    Go Language Spec, such as out-of-bounds slice/array access, close of nil
    channels, type assertion failures, etc.
    
    When these cases occur, the Go runtime panics with an error that implements
    Error. This can be useful when recovering from panics to distinguish between
    custom application panics and fundamental runtime panics.
    
    Packages outside of the Go standard library should not implement Error.
**/
@:go.Type({ name: "Error", instanceName: "runtime.Error", imports: ["runtime"] })
extern typedef Error = {

    @:native("Error") function error(): (String);
    @:native("RuntimeError") function runtimeError(): Void;

}