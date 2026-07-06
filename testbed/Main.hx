import go.Tuple;
import go.Error;
import go.Slice;
import go.Byte;

@:go.Type({ name: "os", imports: ["os"] })
extern class Os {
    @:go.Tuple("file", "err")
    static function readFile(name: String): Tuple<{ file: Slice<Byte>, err: Error }>;
}

class Main {

   public static function main(): Void {
       var v = Os.readFile("./test.txt");
       if (v.err != null) {
           trace("error when opening file", v.err);
       }

//       v = Os.readFile("./other.txt");
//       if (v.err != null) {
//           trace("error when opening another file", v.err);
//       }

       trace("file contents", v.file);
   }

}