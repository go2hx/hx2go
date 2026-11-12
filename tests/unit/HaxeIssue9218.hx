package unit;

function main() {
	assert(format(0) == -1);
}

private function format(w:Null<Int>):Null<Int> {
	if (gate) {
		w--;
	}
	return w;
}

private var gate = true;
