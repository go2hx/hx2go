import go.Float64;
import go.Syntax;
import go.Go;
import go.Int32;
import go.Float32;
import go.Slice;
import go.Fmt;

@:dce(ignore)
@:analyzer(ignore)
class Test {
    public static function main() {
        // Test: Blocks
        //var resA = {
        //    var x: Int32 = 5;
        //    var y: Float32 = 10.0;
        //    x + y;
        //};

        //var resB = {
        //    var x: Int32 = 20;
        //    var y: Float32 = 40.0;
        //    x + y;
        //};

        // Test: Nested Blocks
        //var resC = {
        //    var x: Int32 = 5;
        //    var y: Float32 = {
        //        var z: Int32 = 10;
        //        var w: Float32 = 20;
        //        z * w;
        //    }
        //    x + y;
        //};

        // Test: While Conditional Block
        //var count = 0;
        //while ({
        //    var curr = count;
        //    var max = 10;
        //    curr < max;
        //}) count++;

        // Test: Processing in while conditional
        //var idx = 0;
        //while (idx++ < 10) {}

        // Test: Conditional without special transformations
        //var q = 0;
        //while (q < 10) q++;

        // Test: Shadowing
        //var shadow = 0; shadow = 5;
        //var shadow = 3; shadow = 8;
        //var shadow = true; shadow = false;

        // Test: Pointers
        //var x: Int32 = 5;
        //var y: go.Pointer<Int32> = x;
        //var z: Int = y.value;
        //y.value += 10;
        //go.Fmt.Println(y, y.value, x, z);

        // Test: Basic If
        //var ifOutA = 0;
        //if ({
        //    var a = 5;
        //    var b = 10;
        //    a > b;
        //}) {
        //    ifOutA = 1;
        //} else if ({
        //    var x = 10;
        //    var y = 5;
        //    x != y;
        //}) {
        //    ifOutA = 2;
        //} else {
        //    ifOutA = 3;
        //}

        // Test: Ternary
        //var score = 65;
        //var passed = score > 70 ? "you passed" : "you failed";

        // Test: If as expr
        //var grade = if (score == 100) {
        //    "A+";
        //} else if (score >= 90) {
        //    "A";
        //} else if (score >= 80) {
        //    "B";
        //} else if (score >= 70) {
        //    "C";
        //} else if (score >= 60) {
        //    "D";
        //} else {
        //    "F";
        //}

        // Test: EUnop(...) / OpAssignOp precedence
        //var newCount = 0;
        //var newCountA = newCount++;
        //var newCountB = ++newCount;
        //var newCountC = (newCount += 10);
        //var newCountD = newCount++ * ++newCount + newCount++;

        // Test: EUnop(...) as Stmt vs Expr
        //var k = 0;
        //k++;
        //++k;
        //var k0 = k++;
        //var k1 = ++k;

        // Test: extracting `l` in `l = l + ...` if right-side is extracted
        //var l = 5;
        //var r = 3;
        //l = l + (r = l + r) * (l = l + r);
        //go.Fmt.Println(l, r);

        // Test: ensuring semantics in calls
        //var n = 5; go.Fmt.Println(n, n = n + 3);
        //n = 5; go.Fmt.Println(n, n++);
        //n = 5; go.Fmt.Println(n, n += 5);
    }
}
