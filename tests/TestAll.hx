

function init() {
	Logging.init();
}

function end() {
	trace("\n=== Results ===");
	trace('Passed: ${green(Std.string(passed))}, Failed: ${red(Std.string(failed))}');
	if (failed == 0) {
		trace(green("ALL PASSED"));
	} else {
		trace(red("SOME FAILED"));
		Sys.exit(1);
	}
}

var passed = 0;
var failed = 0;
var colorEnabled = true;

function green(s:String):String
	return colorEnabled ? '\033[32m$s\033[0m' : s;

function red(s:String):String
	return colorEnabled ? '\033[31m$s\033[0m' : s;

function cyan(s:String):String
	return colorEnabled ? '\033[36m$s\033[0m' : s;
