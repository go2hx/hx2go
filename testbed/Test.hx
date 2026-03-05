class Test {
	static function main() {
		var code = Sys.command("echo", ["Hello,", "World!"]);
		Sys.println(code);
		var code = Sys.command("beep", null); // this should fail since beep is not a real command
		Sys.println(code);
	}
}
