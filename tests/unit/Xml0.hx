package unit;

function main() {
    var s = "Haxe is great!";
    var xml = Xml.parse('<root>$s</root>').firstElement();
    assert(xml.firstChild().nodeValue == s);
}