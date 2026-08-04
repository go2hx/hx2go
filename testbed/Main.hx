function main() {
    var regexp:EReg = ~/world/;

    trace(regexp.match("hello world")); // true
    trace(regexp.match("hello")); // false

    var message = "important message: Haxe is great";
    var ereg:EReg = ~/(message).+?(is)/;

    if (ereg.match(message)) {
        trace(ereg.matched(1)); // message
        trace(ereg.matched(2)); // is
        trace(ereg.matchedLeft()); // important
        trace(ereg.matchedRight()); //  great
    }

    var message = "row row row your boat";
    var ereg:EReg = ~/(row)/;

    while (ereg.match(message)) {
        trace(ereg.matched(1));
        message = ereg.matchedRight(); // 3x row
    }

    function getFruits(input:String):Array<{amount:Int, fruit:String}> {
        var ereg = ~/(\d{1,2})\s(.+?)(\n|$)/g;
        var list = [];
        while (ereg.match(input)) {
            list.push({
                amount: Std.parseInt(ereg.matched(1)),
                fruit: ereg.matched(2),
            });
            input = ereg.matchedRight();
        }
        return list;
    }

    var fruits = "1 Apple
    2 Bananas
       3 Pears
      1 Tomato";

    // [{amount:1, fruit:Apple}, {amount:2, fruit:Bananas}, {amount:3, fruit:Pears}, {amount:1, fruit:Tomato}]
    trace(getFruits(fruits));

    var ereg:EReg = ~/(hello)/i;
    var message = "hello world";
    trace(ereg.map(message, function(e) return "happy")); // happy world
}