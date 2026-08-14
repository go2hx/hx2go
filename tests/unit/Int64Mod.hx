package unit;
import haxe.Int64.*;
using haxe.Int64;

function main() {
	var a = Int64.make(0x00002342, 0xDDEF3421);
	var b = Int64.make(0x00000001, 0x00002000);
	var result = a.divMod(b);
	assert(a / b == result.quotient);
	assert(a % b == result.modulus);
}