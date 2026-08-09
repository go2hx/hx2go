package unit;

// Haxe's optimizer rewrites `!(a > b)` into `a <= b`
function main() {
	var nullInt:Null<Int> = null;
	var zero:Null<Int> = 0;
	var one:Null<Int> = 1;
	var minusOne:Null<Int> = -1;

	assert((null > nullInt) == false);
	assert((null >= nullInt) == true);
	assert((null < nullInt) == false);
	assert((null <= nullInt) == true);

	assert((nullInt > null) == false);
	assert((nullInt >= null) == true);
	assert((nullInt < null) == false);
	assert((nullInt <= null) == true);

	assert((0 > nullInt) == false);
	assert((0 >= nullInt) == false);
	assert((0 < nullInt) == false);
	assert((0 <= nullInt) == false);

	assert((nullInt > 0) == false);
	assert((nullInt >= 0) == false);
	assert((nullInt < 0) == false);
	assert((nullInt <= 0) == false);

	assert((1 > nullInt) == false);
	assert((1 <= nullInt) == false);
	assert((nullInt < -1) == false);
	assert((nullInt >= -1) == false);

	assert((zero >= nullInt) == false);
	assert((nullInt <= zero) == false);
	assert((one > nullInt) == false);
	assert((nullInt >= one) == false);
	assert((minusOne < nullInt) == false);
	assert((nullInt <= minusOne) == false);

	// non-null boxed pairs still compare by value
	assert((one > zero) == true);
	assert((zero >= zero) == true);
	assert((minusOne < zero) == true);
	assert((one <= zero) == false);
	assert((one > 0) == true);
	assert((0 < one) == true);
}
