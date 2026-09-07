package unit;

private class Klass {
	var val:Int;
	public var ref:Klass;
	public var intValue:Int;
	public var stringValue:String;
	public function new(v) { val = v; intValue = 55; }
	public function get() return val;
	@:keep public function set(v) { val = v; }
	public function add(x, y) return val + x + y;
}

function main() {
	// keep everything reachable
	var m = new Klass(1);
	m.set(2);
	assert(m.add(1, 1) == 4);
	assert(m.get() == 2);

	var fl = Type.getInstanceFields(Klass);
	fl.sort(Reflect.compare);
	assert(fl.join("|") == "add|get|intValue|ref|set|stringValue|val");
}
