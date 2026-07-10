package unit;


function main() {
    var resA = {
        var x: Int = 5;
        var y: Float = 10.0;
        x + y;
    };
    assert(resA == 15.0);

    var resC = {
        var x: Int = 5;
        var y: Float = {
            var z: Int = 10;
            var w: Float = 20;
            z * w;
        }
        x + y;
    };
    assert(resC == 205.0);

    var count = 0;
    while ({
        var curr = count;
        var max = 10;
        curr < max;
    }) count++;
    assert(count == 10);

    var score = 75;
    assert(score > 70);

    var score2 = 50;
    assert(!(score2 > 70));

    var grade = if (score == 100) {
        "A+";
    } else if (score >= 90) {
        "A";
    } else if (score >= 80) {
        "B";
    } else if (score >= 70) {
        "C";
    } else {
        "F";
    }
    assert(grade == "C");
}
