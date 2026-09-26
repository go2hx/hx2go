package haxe.atomic;

private class AtomicIntValue {

	public var value: go.sync.atomic.Int32;

	public function new(value:Int) {
		this.value.store(value);
	}

}

private typedef AtomicIntData = AtomicIntValue;

abstract AtomicInt(AtomicIntData) {

	public function new(value:Int):Void {
		this = new AtomicIntData(value);
	}

	public function add(b:Int):Int {
		return this.value.add(b) - b;
	}

	public function sub(b:Int):Int {
		return this.value.add(-b) + b;
	}

	public function and(b:Int):Int {
		return this.value.and(b);
	}

	public function or(b:Int):Int {
		return this.value.or(b);
	}

	public function xor(b:Int):Int {
		while (true) {
			var prev = this.value.load();
			if (this.value.compareAndSwap(prev, prev ^ b)) return prev; // ensure that prev hasn't changed and that results are OK
		}

		return 0; // never reached, but needed for IntelliJ
	}

	public function compareExchange(expected:Int, replacement:Int): Int {
		while (true) {
            var curr = this.value.load();
            if (curr != expected) return curr;
            if (this.value.compareAndSwap(expected, replacement)) return expected; // false if fail, hence why we also check ourselves above
        }

		return 0; // never reached, but needed for IntelliJ
	}

	public function exchange(value:Int):Int {
		return this.value.swap(value);
	}

	public function load():Int {
		return this.value.load();
	}

	public function store(value:Int):Int {
		this.value.store(value);
        return value;
	}

}