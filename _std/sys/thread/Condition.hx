package sys.thread;
import go.Chan;

@:coreApi
class Condition {

    private var mutex: go.sync.Mutex;
    private var channels: Array<Chan<Bool>>;

    public function new(): Void {
        channels = [];
    }

    public function acquire(): Void {
        mutex.lock();
    }

    public function tryAcquire(): Bool {
        return mutex.tryLock();
    }

    public function release(): Void {
        mutex.unlock();
    }

    public function wait(): Void {
        var chan = new Chan<Bool>(1);
        channels.push(chan);

        mutex.unlock();
        chan.receive();
        mutex.lock();
    }

    public function signal(): Void {
        if (channels.length > 0) channels.shift().send(true);
    }

    public function broadcast(): Void {
        for (chan in channels) {
            chan.send(true);
        }

        channels.resize(0);
    }

}