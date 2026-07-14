package sys.thread;

@:coreApi
class Mutex {
	@:private var m:go.sync.Mutex;

	public function new() {}

	public function tryAcquire():Bool {
		return this.m.tryLock();
	}

	public function acquire():Void {
		this.m.lock();
	}

	public function release():Void {
		this.m.unlock();
	}
}