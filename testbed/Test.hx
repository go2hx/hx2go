import runtime.HxDynamic;
import go.Go;
import tests.TestReflect;
import tests.runtime.TestHxDynamic;

@:analyzer(ignore)
class Test {
	public static function main() {
       Sys.println( "TestReflect.main():" + TestReflect.main() );
        Sys.println( "TestHxDynamic.main():" + TestHxDynamic.main() );
	}
}
