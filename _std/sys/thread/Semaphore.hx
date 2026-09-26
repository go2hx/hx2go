package sys.thread;

import go.Chan;
import go.Syntax;
import go.sync.atomic.Int32;
import go.Time;
import go.Go;
import go.ReceiveChan;

@:coreApi
class Semaphore {

    private var count: Int32;
    private var chan: Chan<Bool>;

    public function new(value: Int): Void {
        count.store(value);
        chan = new Chan(1);
    }

    public function acquire(): Void {
        while (!tryTake()) chan.receive();
    }

    public function tryAcquire(?timeout: Float): Bool {
        if (tryTake()) return true;
        if (timeout == null || timeout <= 0) return false;

        var dur = ReceiveChan.fromChan(Time.after(Go.int64(timeout * 1e9))); // Time.after should return ReceiveChan<Time>, but it returns Chan<Time>
        while (true) {
            var timedOut = false;

            Syntax.select(
                Select.receive(chan, (_) -> {}),
                Select.receive(dur, (_) -> timedOut = true)
            );

            if (timedOut) return tryTake();
            if (tryTake()) return true;
        }

        return false; // never reached, but needed for IntelliJ
    }

    public function release(): Void {
        count.add(1);
        notify();
    }

    private function tryTake(): Bool {
        while (true) {
            var curr = count.load();
            if (curr <= 0) return false;
            if (count.compareAndSwap(curr, curr - 1)) {
                if (curr - 1 > 0) notify();
                return true;
            }
        }

        return false; // never reached, but needed for IntelliJ
    }

    private function notify(): Void {
        Syntax.select(
            Select.send(chan, true, () -> {}),
            Select.defaultCase(() -> {})
        );
    }

}