package sys.thread;
import go.Chan;
import go.Syntax;

@:coreApi
class Deque<T> {

    private var mutex: go.sync.Mutex;
    private var items: Array<T>;
    private var chan: Chan<Bool>;

	public function new(): Void {
        items = [];
        chan = new Chan(1);
    }

	public function add(i: T): Void {
        mutex.lock();
        items.push(i);
        mutex.unlock();

        notify();
    }

	public function push(i: T): Void {
        mutex.lock();
        items.unshift(i);
        mutex.unlock();

        notify();
    }

	public function pop(block: Bool): Null<T> {
        while (true) {
            mutex.lock();
            if (items.length > 0) {
                var v = items.shift();
                var hasItems = items.length > 0;
                mutex.unlock();

                if (hasItems) {
                    notify();
                }

                return v;
            }

            mutex.unlock();

            if (!block) return null;
            chan.receive();
        }

        return null; // never reached, but needed for IntelliJ
    }

    private function notify(): Void {
        Syntax.select(
            Select.send(chan, true, () -> {}),
            Select.defaultCase(() -> {})
        );
    }

}