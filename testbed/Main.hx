function main() {
	var f1_1:(?x:NInt)->NInt = (?x:NInt) -> 2;
	trace(f1_1());
}

dynamic function foo(?x:NInt) {
	return x;
}

typedef NInt = Int;
