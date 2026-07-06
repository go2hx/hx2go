import go.Tuple;
import go.Error;

@:go.Type({ name: "bytes", imports: ["bytes"] })
extern class Bytes {}

@:go.Type({ name: "os", imports: ["os"] })
extern class Os {
    @:go.Tuple("file", "err")
    static function readFile(name: String): Tuple<{ file: Bytes, err: Error }>;
}

class Main {

   public static function main(): Void {
       var v = Os.readFile("./test.txt");
       if (v.err != null) {
           trace("error when opening file", v.err);
       }

       trace("file contents", v.file);
   }

}