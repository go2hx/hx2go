package unit;

using unit.Issue2947.Issue2497Class;

function main() {
	var sayHelloTo:String->?String->String = "hello".addTail;
	assert(sayHelloTo("world") == "hello world !");
	assert(sayHelloTo("world", "?") == "hello world ?");
}

class Issue2497Class {
	public static var addTail:String->String->?String->String = actualFx;

	public static function actualFx(str1:String, str2:String, ?str3:String = "!") {
		return str1 + " " + str2 + " " + str3;
	}
}