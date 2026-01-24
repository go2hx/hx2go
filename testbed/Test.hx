import go.Fmt;
import go.Pointer;

class Test {

    public static function main() {
        var arr = ["你好", "世界"];
        arr.push("!");
        arr.reverse();

        for (word in arr) {
            Fmt.println(word);
        }

        Sys.println(arr.copy());
        Sys.println(arr.join(", "));
        Sys.println("Array Length: " + Std.string(arr.length));
        Sys.println("Summed Character Count: " + Std.string(lengthOfAll(arr)));

        var ptr = Pointer.addressOf(arr);
        Sys.println(ptr);

        var sin = Math.sin(Math.PI / 2);
        Sys.println("Sin(PI/2): " + Std.string(sin));
    }

    public static function lengthOfAll(arr: Array<String>) {
        var sum = 0;
        for (s in arr) {
            sum += s.length;
        }

        return sum;
    }

}

