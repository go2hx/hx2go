package unit;

private var nullValue:Null<Float> = null;
private var floatValue:Null<Float> = 100;
private var intValue:Null<Int> = 7;
private var stringValue:Null<String> = "text";

function main() {
    assert(nullValue != floatValue);
    assert(floatValue != nullValue);
    assert(floatValue == 100);
    assert(intValue == 7);
    assert(stringValue == "text");
}
