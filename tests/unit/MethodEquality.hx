package unit;
function main() {
	final emptyOnData:(String)->Void = null;
	var onData = (s:String) -> {}
	assert(Reflect.compareMethods(emptyOnData, onData) == false);
}


class Http2 {
	public final emptyOnData:(String)->Void;
	public dynamic function onData(data:String) {}
	public function new() {
		emptyOnData = onData;
	}
}