class Test {
	static function main() {
		var str: String = "Hello World";
		var abs: CoolString = str;
		abs.logIt();

		trace('charAt abstract', abs.charAt(0));

		var str2: String = abs;
		trace('charAt str', str2.charAt(0));
	}
}
