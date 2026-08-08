package unit;
function main() {
	var a8:Dynamic = 10;
    var b8:Dynamic = a8 & 15;
	var c8:Dynamic = a8 | 15;

	assert(b8 == 10);
	assert(c8 == 15);
}