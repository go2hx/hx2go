// Sys.go.hx
import go.os.exec.ExitError;
import go.Result;
import go.os.Os;
import go.os.exec.Exec;
import go.Fmt;
import go.time.Time;
import go.runtime.Runtime;
import runtime.HxArray;
import go.Syntax;
import go.Slice;
import go.Error;
import go.Pointer;

/**
	This class provides access to various base functions of system platforms.
	Look in the `sys` package for more system APIs.
**/
class Sys {
	/**
		Prints any value to the standard output.
	**/
	public static function print<T>(v:T):Void
		Fmt.print(v);

	/**
		Prints any value to the standard output, followed by a newline.
		On Windows, this function outputs a CRLF newline.
		LF newlines are printed on all other platforms.
	**/
	public static function println<T>(v:T):Void
		Fmt.println(v);

	/**
		Returns all the arguments that were passed in the command line.
		This does not include the interpreter or the name of the program file.

		(java)(eval) On Windows, non-ASCII Unicode arguments will not work correctly.

		(cs) Non-ASCII Unicode arguments will not work correctly.
	**/
	public static function args():Array<String> {
		var ret:Array<String> = [];
		HxArray.setData(ret, Os.Args);
		HxArray.shift(ret); // remove first entry so that the location of the executable is not included
		return ret;
	}

	/**
		Returns the value of the given environment variable, or `null` if it
		doesn't exist.
	**/
	public static function getEnv(s:String):String
		return Os.getenv(s);

	/**
		Sets the value of the given environment variable.

		If `v` is `null`, the environment variable is removed.

		(java) This functionality is not available on Java; calling this function will throw.
	**/
	public static function putEnv(s:String, v:Null<String>):Void {
		// TODO rewrite when Null<String> has been defined in hx2go
		// if (v == null) {
		// 	// TODO remove env var
		// } else {
		var err = Os.setenv(s, v);
		if (err != null)
			throw err.error();
		// }
	}

	/**
		Returns a map of the current environment variables and their values
		as of the invocation of the function.

		(python) On Windows, the variable names are always in upper case.

		(cpp)(hl)(neko) On Windows, the variable names match the last capitalization used when modifying
		the variable if the variable has been modified, otherwise they match their capitalization at
		the start of the process.

		On Windows on remaining targets, variable name capitalization matches however they were capitalized
		at the start of the process or at the moment of their creation.
	**/
	public static function environment():Dynamic { // TODO Map<String, String> {
		// var ret = new Map<String, String>();  // TODO Map<String, String> not stable yet
		var envs = Os.environ();
		Fmt.println("envs: " + envs);
		// for (env in envs) {
		// 	var tup = Syntax.split2(env, "="); // TODO this is not correct since values can also contain "="
		// 	ret.set(tup[0], tup[1]);
		// }
		return null; // ret;
	}

	//  return null; // TODO Map<String, String> not stable yet

	/**
		Suspends execution for the given length of time (in seconds).
	**/
	public static function sleep(seconds:Float):Void
		return Time.sleep(Time.second * seconds);

	/**
		Changes the current time locale, which will affect `DateTools.format` date formating.
		Returns `true` if the locale was successfully changed.
	**/
	public static function setTimeLocale(loc:String):Bool
		return false; // TODO

	/**
		Gets the current working directory (usually the one in which the program was started).
	**/
	public static function getCwd():String {
		return Os.getwd().sure();
	}

	/**
		Changes the current working directory.

		(java) This functionality is not available on Java; calling this function will throw.
	**/
	public static function setCwd(s:String):Void {
		var err = Os.chdir(s);
		if (err != null)
			throw err.error();
	}

	/**
		Returns the type of the current system. Possible values are:
		 - `"Windows"`
		 - `"Linux"`
		 - `"BSD"`
		 - `"Mac"`
	**/
	public static function systemName():String {
		// TODO where do other Go supported OSs (aix, dragonfly, illumos, ios, js, plan9, solaris, wasip1) map to in Haxe?
		// TODO use switch statement when it is working in hx2go
		if (Runtime.GOOS == "windows")
			return "Windows";
		if (Runtime.GOOS == "linux" || Runtime.GOOS == "android")
			return "Linux";
		if (Runtime.GOOS == "freebsd" || Runtime.GOOS == "netbsd" || Runtime.GOOS == "openbsd")
			return "BSD";
		if (Runtime.GOOS == "darwin")
			return "Mac";
		return Runtime.GOOS; // otherwise return the Go name
	}

	/**
		Runs the given command. The command output will be printed to the same output as the current process.
		The current process will block until the command terminates.
		The return value is the exit code of the command (usually `0` indicates no error).

		Command arguments can be passed in two ways:

		 1. Using `args` to pass command arguments. Each argument will be automatically quoted and shell meta-characters will be escaped if needed.
		`cmd` should be an executable name that can be located in the `PATH` environment variable, or a full path to an executable.

		 2. When `args` is not given or is `null`, command arguments can be appended to `cmd`. No automatic quoting/escaping will be performed. `cmd` should be formatted exactly as it would be when typed at the command line.
		It can run executables, as well as shell commands that are not executables (e.g. on Windows: `dir`, `cd`, `echo` etc).

		Use the `sys.io.Process` API for more complex tasks, such as background processes, or providing input to the command.
	**/
	@:analyzer(ignore)
	public static function command(cmd:String, ?args:Array<String>):Int { 
		// for called Go in Syntax.code() see https://pkg.go.dev/os/exec
		
		var argSlice = new go.Slice<String>();
		if (args != null)
			argSlice = HxArray.getData(args); // make sure args is a real array and not null so that it can be passed to Go correctly

		var err:Error = null;
		var output:go.Slice<go.UInt8> = null;
		Syntax.code("output, err = exec.Command({0},{1}...).Output()", cmd, argSlice);

		var exitErr:Pointer<ExitError> = null; // using ExitError causes os/exec to be imported 
		var ok:Bool = false;
		var ret = 0; // default to 0 (success) but will change if there is an error
		if (err != null) {
			Syntax.code("exitErr, ok = err.(*exec.ExitError)");
			if (ok)
				Syntax.code("ret = exitErr.ProcessState.ExitCode()");
			else
				ret = -1; // command did not even run
		} else {
			var outputStr = "";
			Syntax.code("outputStr = string(output)");
			Fmt.print(outputStr); // print command output if it ran successfully
		}
		return ret;
	}

	/**
		Exits the current process with the given exit code.

		(macro)(eval) Being invoked in a macro or eval context (e.g. with `-x` or `--run`) immediately terminates
		the compilation process, which also prevents the execution of any `--next` sections of compilation arguments.
	**/
	public static function exit(code:Int):Void {
		Os.exit(code);
	}

	/**
		Gives the most precise timestamp value available (in seconds).
	**/
	public static function time():Float {
		var tn = Time.now();
		var ret = (tn.unixNano() : Float) / 1000000000.0;
		var tup = tn.local().zone();
		ret += (tup.offset : Float);
		return ret;
	}

	/**
		Gives the most precise timestamp value available (in seconds),
		but only accounts for the actual time spent running on the CPU for the current thread/process.
	**/
	/* Go code:
		package main

		import (
		"fmt"
		"runtime/metrics"
		)

		func main() {
		// Name of the metric we want to read.
		const myMetric = "/cpu/classes/user:cpu-seconds"

		// Create a sample for the metric.
		sample := make([]metrics.Sample, 1)
		sample[0].Name = myMetric

		// Sample the metric.
		metrics.Read(sample)

		// Check if the metric is actually supported.
		// If it's not, the resulting value will always have
		// kind KindBad.
		if sample[0].Value.Kind() == metrics.KindBad {
			panic(fmt.Sprintf("metric %q no longer supported", myMetric))
		}
		if sample[0].Value.Kind() == metrics.KindFloat64 {

			fmt.Println(sample[0].Value.Float64())

		}
		// error
		}
	 */
	static function cpuTime():Float
		return 0.0; // TODO

	/**
		Returns the path to the current executable that we are running.
	**/
	@:deprecated("Use programPath instead") public static function executablePath():String
		return programPath();

	/**
		Returns the absolute path to the current program file that we are running.
		Concretely, for an executable binary, it returns the path to the binary.
		For a script (e.g. a PHP file), it returns the path to the script.
	**/
	public static function programPath():String
		return Os.Args[0];

	/**
		Reads a single input character from the standard input and returns it.
		Setting `echo` to `true` will also display the character on the output.
	**/
	// TODO wait until stdin() stdout() & stderr() below are resolved first
	// TODO then maybe https://pkg.go.dev/golang.org/x/term https://stackoverflow.com/questions/15159118/read-a-character-from-standard-input-in-go-without-pressing-enter
	// static function getChar(echo:Bool):Int
	//  return -1;
	/**
		Returns the standard input of the process, from which user input can be read.
		Usually it will block until the user sends a full input line.
		See `getChar` for an alternative.
	**/
	// static function stdin():haxe.io.Input
	//     return null; // TODO
	/**
		Returns the standard output of the process, to which program output can be written.
	**/
	// static function stdout():haxe.io.Output
	//     return null; // TODO
	/**
		Returns the standard error of the process, to which program errors can be written.
	**/
	// static function stderr():haxe.io.Output
	//     return null; // TODO
}
