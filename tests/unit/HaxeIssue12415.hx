package unit;

@:fromNull
private abstract Int64Null(haxe.Int64) from haxe.Int64 to haxe.Int64 {
	public inline function isNull() {
		if (abstract == null) return true;
		return haxe.Int64.isZero(this);
	}
}

function main() {
	var value:Int64Null = null;
	assert(value == null);
	assert(!(value != null));
	assert(value.isNull());
}
