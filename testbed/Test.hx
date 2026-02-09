import go.Go;

@:analyzer(ignore)
class Test {
	public static function main() {
		var i:Int = 15;
		var f:Float = 20.3;

		var i32 = Go.int32(10);
		var u32 = Go.uint32(10);

		Sys.println(i == f);
		Sys.println(i32 == u32);

		var aI:Int = -1;
		var bI:Int = 1;
		Sys.println((aI >>> bI : Int));

		var f_ = Std.int(f);

		Sys.println(f_);

		var parsed = Std.parseInt("1");
		Sys.println(parsed);
		var parsed_float = Std.parseFloat("1.01");
		Sys.println(parsed_float);

		var rand_num = Std.random(100);
		Sys.println('Random number: ${Std.string(rand_num)}');
	}
}
