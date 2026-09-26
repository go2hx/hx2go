package sys.thread;

@:coreApi
class Lock {

	var _s: Semaphore;

	public function new(): Void {
		_s = new Semaphore(0);
	}

	public function wait(?timeout:Float):Bool {
		if (timeout == null) {
			_s.acquire();
			return true;
		}

		return _s.tryAcquire(timeout);
	}

	public function release():Void {
		_s.release();
	}

}