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
        var resA = {
            var x: Int32 = 5;
            var y: Float32 = 10.0;
            x + y;
        };

        var resB = {
            var x: Int32 = 20;
            var y: Float32 = 40.0;
            x + y;
        };

        // Test: Nested Blocks
        var resC = {
            var x: Int32 = 5;
            var y: Float32 = {
                var z: Int32 = 10;
                var w: Float32 = 20;
                z * w;
            }
            x + y;
        };

        // Test: While Conditional Block
        var count = 0;
        while ({
            var curr = count;
            var max = 10;
            curr < max;
        }) count++;

        // Test: Processing in while conditional
        var idx = 0;
        while (idx++ < 10) {}

        // Test: Conditional without special transformations
        var q = 0;
        while (q < 10) q++;

        // Test: Shadowing
        var shadow = 5; shadow = 0;
        var shadow = 8; shadow = 3;
        var shadow = false; shadow = true;
        var shadow = {
            var shadow = 0; shadow = 5;
            var shadow = 3; shadow = 8;
            var shadow = true; shadow = false;
        }
        go.Fmt.Println(shadow);

        // Test: Pointers
        var valA: Int32 = 5;
        var ptrA: go.Pointer<Int32> = go.Pointer.addressOf(valA);
        var valB: Int32 = ptrA.value;
        ptrA.value += 10;
        var valC: Int32 = ptrA.value;
        go.Fmt.Println(ptrA, valA, valB, valC);

        // Test: Basic If
        var ifOutA = 0;
        if ({
            var a = 5;
            var b = 10;
            a > b;
        }) {
            ifOutA = 1;
        } else if ({
            var x = 10;
            var y = 5;
            x != y;
        }) {
            ifOutA = 2;
        } else {
            ifOutA = 3;
        }

        go.Fmt.Println(ifOutA);

        // Test: Ternary
        var score = 75;
        var passed = score > 70 ? "you passed" : "you failed";

        // Test: null coal
        var strA: String = null;
        var strB: String = strA ?? "null coal works!";

        // Test: If as expr
        var grade = if (score == 100) {
            "A+";
        } else if (score >= 90) {
            "A";
        } else if (score >= 80) {
            "B";
        } else if (score >= 70) {
            "C";
        } else if (score >= 60) {
            "D";
        } else {
            "F";
        }

        go.Fmt.Println(score, passed, grade, strB);

        // Test: EUnop(...) / OpAssignOp precedence
        var newCount = 0;
        var newCountA = newCount++;
        var newCountB = ++newCount;
        var newCountC = (newCount += 10);
        var newCountD = newCount++ * ++newCount + newCount++;
        go.Fmt.Println(newCount, newCountA, newCountB, newCountC, newCountD);

        // Test: EUnop(...) as Stmt vs Expr
        var k = 0;
        k++;
        ++k;
        var k0 = k++;
        var k1 = ++k;

        // Test: extracting `l` in `l = l + ...` if right-side is extracted
        var l = 5;
        var r = 3;
        l = l + (r = l + r) * (l = l + r);
        go.Fmt.Println(l, r);

        // Test: ensuring semantics in calls
        var n = 5; go.Fmt.Println(n, n = n + 3, n);
        n = 5; go.Fmt.Println(n, n++, n);
        n = 5; go.Fmt.Println(n, n += 5, n);
        n = 5; go.Fmt.Println(n, n + 5, n);

        // Test: Short circuiting (and)
        var s1 = 0;
        var s2 = 0;
        if (s1 == 100 && ++s2 < 100) {
            go.Fmt.Println("AND branch reached");
        }

        go.Fmt.Println("should be zero", s2);

        // Test: Short circuiting (or)
        var s3 = 0;
        var s4 = 0;
        if (s3 < s4 || s4++ < 100) {
            go.Fmt.Println("OR branch reached");
        }

        go.Fmt.Println("s4 value", s4);
    }
}
