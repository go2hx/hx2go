package unit;
function main() {
	// From TestOps.hx:184-7
	var nullBool:Null<Bool> = null;
	var nullBoolfalse:Null<Bool> = false;

	assert(!(nullBoolfalse == nullBool));
	assert(!(nullBool == nullBoolfalse)); 
    assert(nullBoolfalse != nullBool);
    assert(nullBool != nullBoolfalse);
}