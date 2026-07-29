package unit;
#if utest

import utest.ui.Report;
import utest.Runner;

function main() {
    var runner = new Runner();
    Report.create(runner);
    runner.run();
    trace(runner.length);
}

#else
function main() {
    trace("no utest lib");
}
#end