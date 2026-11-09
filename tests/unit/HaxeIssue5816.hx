package unit;

import haxe.Int64;

class Issue5816 {
	static var value:Int64 = 0;

	public function new() {}

	public function test() {
		assert(value == 0);
		value++;
		assert(value == 1);
	}
}

function main() {
	var issue = new Issue5816();
	issue.test();
}
