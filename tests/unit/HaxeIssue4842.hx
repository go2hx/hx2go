package unit;

inline function isNull<T>(maybeNull:Null<T>):Bool
	return {
		maybeNull == null;
	}

function main() {
	var i:Int = 0;
	assert(isNull(i) == false);
	var u:UInt = 0;
	assert(isNull(u) == false);
	var i64:haxe.Int64 = haxe.Int64.make(0, 0);
	assert(isNull(i64) == false);
}
