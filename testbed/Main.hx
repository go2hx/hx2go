import go.Slice;
import go.Byte;
import go.Result;

@:go.Type({ name: "os", imports: ["os"] })
extern class Os {
    static function readFile(name: String): Result<Slice<Byte>>;
}

class Main {

   public static function main(): Void {
       var v = Os.readFile("./test.txt");
       var t = v.tuple();
       trace(t.result, t.error);
       trace(v.sure());
   }

}