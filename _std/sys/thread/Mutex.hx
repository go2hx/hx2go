package sys.thread;

import go.sync.atomic.Int32;

@:coreApi
class Mutex {

	private var mutex: go.sync.Mutex;
    private var holder: Int32;
    private var count: Int = 0;

	public function new() {
		holder.store(-1);
    }

	public function tryAcquire():Bool {
		return mutex.tryLock(); // TODO: fix
	}

	public function acquire():Void {
		var id = @:privateAccess ThreadImpl.getGoroutineId();
        if (holder.load() == id) {
            count++;
            return;
        }

        mutex.lock();
        holder.store(id);
        count = 1;
	}

	public function release():Void {
        if (holder.load() != @:privateAccess ThreadImpl.getGoroutineId()) {
			throw "same thread must release mutex";
        }

		count--;
        if (count == 0) {
            holder.store(-1);
            mutex.unlock();
        }
	}
}