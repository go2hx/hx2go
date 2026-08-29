package go.runtime;

/**
    Frames may be used to get function/file/line information for a
    slice of PC values returned by [Callers].
**/
@:structInit
@:go.Type({ name: "Frames", instanceName: "runtime.Frames", imports: ["runtime"] })
extern class Frames {

    /**
        Next returns a [Frame] representing the next call frame in the slice
        of PC values. If it has already returned all call frames, Next
        returns a zero [Frame].
        
        The more result indicates whether the next call to Next will return
        a valid [Frame]. It does not necessarily indicate whether this call
        returned one.
        
        See the [Frames] example for idiomatic usage.
    **/
    @:go.Tuple("frame", "more") @:native("Next") function next(): (go.Tuple<{ frame: go.runtime.Frame, more: Bool }>);

}