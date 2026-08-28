package go.time;

/**
    The Timer type represents a single event.
    When the Timer expires, the current time will be sent on C,
    unless the Timer was created by [AfterFunc].
    A Timer must be created with [NewTimer] or AfterFunc.
**/
@:structInit
@:go.Type({ name: "Timer", instanceName: "time.Timer", imports: ["time"] })
extern class Timer {

    @:native("C") var C: go.Chan<go.time.Time>;

    function new(C: go.Chan<go.time.Time>=null);

    /**
        Reset changes the timer to expire after duration d.
        It returns true if the timer had been active, false if the timer had
        expired or been stopped.
        
        For a func-based timer created with [AfterFunc](d, f), Reset either reschedules
        when f will run, in which case Reset returns true, or schedules f
        to run again, in which case it returns false.
        When Reset returns false, Reset neither waits for the prior f to
        complete before returning nor does it guarantee that the subsequent
        goroutine running f does not run concurrently with the prior
        one. If the caller needs to know whether the prior execution of
        f is completed, it must coordinate with f explicitly.
        
        For a chan-based timer created with NewTimer, as of Go 1.23,
        any receive from t.C after Reset has returned is guaranteed not
        to receive a time value corresponding to the previous timer settings;
        if the program has not received from t.C already and the timer is
        running, Reset is guaranteed to return true.
        Before Go 1.23, the only safe way to use Reset was to call [Timer.Stop]
        and explicitly drain the timer first.
        See the [NewTimer] documentation for more details.
    **/
    @:native("Reset") function reset(d: go.time.Duration): (Bool);
    /**
        Stop prevents the [Timer] from firing.
        It returns true if the call stops the timer, false if the timer has already
        expired or been stopped.
        
        For a func-based timer created with [AfterFunc](d, f),
        if t.Stop returns false, then the timer has already expired
        and the function f has been started in its own goroutine;
        Stop does not wait for f to complete before returning.
        If the caller needs to know whether f is completed,
        it must coordinate with f explicitly.
        
        For a chan-based timer created with NewTimer(d), as of Go 1.23,
        any receive from t.C after Stop has returned is guaranteed to block
        rather than receive a stale time value from before the Stop;
        if the program has not received from t.C already and the timer is
        running, Stop is guaranteed to return true.
        Before Go 1.23, the only safe way to use Stop was insert an extra
        <-t.C if Stop returned false to drain a potential stale value.
        See the [NewTimer] documentation for more details.
    **/
    @:native("Stop") function stop(): (Bool);

}