package unit;
function main() {
	var s:go.Slice<go.Byte> = ['h'.code, 'e'.code, 'y'.code];
	var str:String = s;
	assert(str == "hey");
}