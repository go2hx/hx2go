package unit;

function main() {
	final map:Map<String, Array<Int>> = [];
	var array1 = [];
	map["foo"] ??= array1;
	assert(map["foo"] == array1);

	map["foo"] ??= [];
	assert(map["foo"] == array1);
}
