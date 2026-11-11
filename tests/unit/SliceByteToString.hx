package unit;
function main() {
	#if go
	var s:go.Slice<go.Byte> = ['h'.code, 'e'.code, 'y'.code];
	var str:String = s;
	assert(str == "hey");
	#end
}