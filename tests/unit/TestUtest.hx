package unit;
#if utest
import utest.Assert;
import utest.ui.Report;
import utest.Runner;

class TestBasic implements utest.ITest {
    public function new() {}

    public function testAdd() {
        Assert.equals(3, 1 + 2);
    }

    public function testStrings() {
        Assert.equals("hello world", "hello" + " " + "world");
        Assert.isTrue("abc".indexOf("b") == 1);
    }

    public function testArray() {
        var a = [1, 2, 3];
        a.push(4);
        Assert.equals(4, a.length);
        Assert.same([1, 2, 3, 4], a);
    }

    public function testCompare() {
        Assert.equals(2, 2);
    }
}

function main() {
    var runner = new Runner();
    runner.addCase(new TestBasic());
    Report.create(runner);
    runner.run();
}
#else
function main() {
    trace("no utest lib");
}
#end