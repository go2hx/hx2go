package unit;
function main() {
	var a : Array<Null<Int>> = [1,2,3];
	var as = a.splice(1,1);
	assert(as.length == 1);
	assert(as[0] == 2);
	assert(a.length == 2);
	assert(a[0] == 1);
	assert(a[1] == 3);
	assert(a[2] == null);
}