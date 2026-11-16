package unit;

private enum SomeEnum {
	Value(i:Int);
}

function main() {
	var reached = false;
	try {
		switch ((null : SomeEnum)) {
			case Value(i):
				reached = true;
		}
	} catch (e:Dynamic) {}
	assert(!reached);
}
