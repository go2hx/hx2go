package go.sync;

/**
    A WaitGroup is a counting semaphore typically used to wait
    for a group of goroutines or tasks to finish.
    
    Typically, a main goroutine will start tasks, each in a new
    goroutine, by calling [WaitGroup.Go] and then wait for all tasks to
    complete by calling [WaitGroup.Wait]. For example:
    
    	var wg sync.WaitGroup
    	wg.Go(task1)
    	wg.Go(task2)
    	wg.Wait()
    
    A WaitGroup may also be used for tracking tasks without using Go to
    start new goroutines by using [WaitGroup.Add] and [WaitGroup.Done].
    
    The previous example can be rewritten using explicitly created
    goroutines along with Add and Done:
    
    	var wg sync.WaitGroup
    	wg.Add(1)
    	go func() {
    		defer wg.Done()
    		task1()
    	}()
    	wg.Add(1)
    	go func() {
    		defer wg.Done()
    		task2()
    	}()
    	wg.Wait()
    
    This pattern is common in code that predates [WaitGroup.Go].
    
    A WaitGroup must not be copied after first use.
**/
@:structInit
@:go.Type({ name: "WaitGroup", instanceName: "sync.WaitGroup", imports: ["sync"] })
extern class WaitGroup {

    /**
        Add adds delta, which may be negative, to the [WaitGroup] task counter.
        If the counter becomes zero, all goroutines blocked on [WaitGroup.Wait] are released.
        If the counter goes negative, Add panics.
        
        Callers should prefer [WaitGroup.Go].
        
        Note that calls with a positive delta that occur when the counter is zero
        must happen before a Wait. Calls with a negative delta, or calls with a
        positive delta that start when the counter is greater than zero, may happen
        at any time.
        Typically this means the calls to Add should execute before the statement
        creating the goroutine or other event to be waited for.
        If a WaitGroup is reused to wait for several independent sets of events,
        new Add calls must happen after all previous Wait calls have returned.
        See the WaitGroup example.
    **/
    @:native("Add") function add(delta: go.GoInt): Void;
    /**
        Done decrements the [WaitGroup] task counter by one.
        It is equivalent to Add(-1).
        
        Callers should prefer [WaitGroup.Go].
        
        In the terminology of [the Go memory model], a call to Done
        "synchronizes before" the return of any Wait call that it unblocks.
        
        [the Go memory model]: https://go.dev/ref/mem
    **/
    @:native("Done") function done(): Void;
    /**
        Go calls f in a new goroutine and adds that task to the [WaitGroup].
        When f returns, the task is removed from the WaitGroup.
        
        The function f must not panic.
        
        If the WaitGroup is empty, Go must happen before a [WaitGroup.Wait].
        Typically, this simply means Go is called to start tasks before Wait is called.
        If the WaitGroup is not empty, Go may happen at any time.
        This means a goroutine started by Go may itself call Go.
        If a WaitGroup is reused to wait for several independent sets of tasks,
        new Go calls must happen after all previous Wait calls have returned.
        
        In the terminology of [the Go memory model], the return from f
        "synchronizes before" the return of any Wait call that it unblocks.
        
        [the Go memory model]: https://go.dev/ref/mem
    **/
    @:native("Go") function go(f: () -> Void): Void;
    /**
        Wait blocks until the [WaitGroup] task counter is zero.
    **/
    @:native("Wait") function wait(): Void;

}