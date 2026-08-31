package go.crypto;

/**
    Package subtle implements functions that are often useful in cryptographic
    code but require careful thought to use correctly.
**/
@:go.Type({ name: "subtle", instanceName: "subtle.subtle", imports: ["crypto/subtle"] })
extern class Subtle {

    /**
        ConstantTimeByteEq returns 1 if x == y and 0 otherwise.
    **/
    @:native("ConstantTimeByteEq") static function constantTimeByteEq(x: go.UInt8, y: go.UInt8): (go.GoInt);
    /**
        ConstantTimeCompare returns 1 if the two slices, x and y, have equal contents
        and 0 otherwise. The time taken is a function of the length of the slices and
        is independent of the contents. If the lengths of x and y do not match it
        returns 0 immediately.
    **/
    @:native("ConstantTimeCompare") static function constantTimeCompare(x: go.Slice<go.Byte>, y: go.Slice<go.Byte>): (go.GoInt);
    /**
        ConstantTimeCopy copies the contents of y into x (a slice of equal length)
        if v == 1. If v == 0, x is left unchanged. Its behavior is undefined if v
        takes any other value.
    **/
    @:native("ConstantTimeCopy") static function constantTimeCopy(v: go.GoInt, x: go.Slice<go.Byte>, y: go.Slice<go.Byte>): Void;
    /**
        ConstantTimeEq returns 1 if x == y and 0 otherwise.
    **/
    @:native("ConstantTimeEq") static function constantTimeEq(x: go.Int32, y: go.Int32): (go.GoInt);
    /**
        ConstantTimeLessOrEq returns 1 if x <= y and 0 otherwise.
        Its behavior is undefined if x or y are negative or > 2**31 - 1.
    **/
    @:native("ConstantTimeLessOrEq") static function constantTimeLessOrEq(x: go.GoInt, y: go.GoInt): (go.GoInt);
    /**
        ConstantTimeSelect returns x if v == 1 and y if v == 0.
        Its behavior is undefined if v takes any other value.
    **/
    @:native("ConstantTimeSelect") static function constantTimeSelect(v: go.GoInt, x: go.GoInt, y: go.GoInt): (go.GoInt);
    /**
        WithDataIndependentTiming enables architecture specific features which ensure
        that the timing of specific instructions is independent of their inputs
        before executing f. On f returning it disables these features.
        
        Any goroutine spawned by f will also have data independent timing enabled for
        its lifetime, as well as any of their descendant goroutines.
        
        Any C code called via cgo from within f, or from a goroutine spawned by f, will
        also have data independent timing enabled for the duration of the call. If the
        C code disables data independent timing, it will be re-enabled on return to Go.
        
        If C code called via cgo, from f or elsewhere, enables or disables data
        independent timing then calling into Go will preserve that state for the
        duration of the call.
        
        WithDataIndependentTiming should only be used when f is written to make use
        of constant-time operations. WithDataIndependentTiming does not make
        variable-time code constant-time.
        
        Calls to WithDataIndependentTiming may be nested.
        
        On Arm64 processors with FEAT_DIT, WithDataIndependentTiming enables
        PSTATE.DIT. See https://developer.arm.com/documentation/ka005181/1-0/?lang=en.
        
        Currently, on all other architectures WithDataIndependentTiming executes f immediately
        with no other side-effects.
    **/
    @:native("WithDataIndependentTiming") static function withDataIndependentTiming(f: () -> Void): Void;
    /**
        XORBytes sets dst[i] = x[i] ^ y[i] for all i < n = min(len(x), len(y)),
        returning n, the number of bytes written to dst.
        
        If dst does not have length at least n,
        XORBytes panics without writing anything to dst.
        
        dst and x or y may overlap exactly or not at all,
        otherwise XORBytes may panic.
    **/
    @:native("XORBytes") static function xORBytes(dst: go.Slice<go.Byte>, x: go.Slice<go.Byte>, y: go.Slice<go.Byte>): (go.GoInt);

}