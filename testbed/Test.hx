import go.Tuple;
import go.Fmt;
import go.GoInt;
import go.time.Time;
import go.os.Os;
import go.runtime.Runtime;
import tests.runtime.TestHxDynamic;
import tests.TestReflect;

class Test {
	public static function main():Void {
		Sys.println("TestReflect.main():" + TestReflect.main());
		Sys.println("TestHxDynamic.main():" + TestHxDynamic.main());
		Sys.println(Sys.getCwd());
		Sys.setCwd("..");
		Sys.println(Sys.getCwd());
		Sys.setCwd("./export");
		Sys.println(Sys.getCwd());
		Sys.println(Sys.systemName());
		Sys.println(Sys.programPath());
		Sys.println(Sys.args());
		Sys.println(Sys.programPath());
		Sys.println(Sys.getEnv("HOME"));

		var t1 = Sys.time();
		Sys.println(t1);
		var t2 = Sys.time();
		Sys.println((t2 - t1) * 1000000);

		#if sys
		Sys.println("sys!");
		#end
		Sys.exit(42);
	}
}
