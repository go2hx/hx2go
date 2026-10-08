package unit;

function main() {
		var obj = new NullCoalClass();
		obj.field ??= "value";
		assert(1 == obj.getCounter); 
		assert(1 == obj.setCounter); 
		assert("value" == obj.field ?? "fail");

		var abs = new NullCoalAbstract();
		abs.field ??= "value";
		assert(1 == abs.getGetCounter()); 
		assert(1 == abs.getSetCounter());  
		assert("value" == abs.field ?? "fail"); 

	}

class NullCoalClass {
	@:isVar public var field(get, set):String;

	public var getCounter = 0;
	public var setCounter = 0;

	public function new() {}

	public function get_field() {
		getCounter++;
		return field;
	}

	public function set_field(v:String) {
		setCounter++;
		return field = v;
	}
}

private typedef NullCoalAbstractData = {
	var field:String;
	var getCounter:Int;
	var setCounter:Int;
}

private abstract NullCoalAbstract(NullCoalAbstractData) {
	public var field(get, set):String;

	public function new() {
		this = {
			field: null,
			getCounter: 0,
			setCounter: 0
		}
	}

	public function getGetCounter() {
		return this.getCounter;
	}

	public function getSetCounter() {
		return this.setCounter;
	}

	public function get_field() {
		this.getCounter++;
		return this.field;
	}

	public function set_field(v:String) {
		this.setCounter++;
		return this.field = v;
	}
}