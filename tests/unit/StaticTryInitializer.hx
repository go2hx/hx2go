package unit;

private class Initializer {
    public static var caught = try { throw "static"; } catch (value:String) { value; };
}

function main() {
    static var caught = try { throw "local"; } catch (value:String) { value; };
    assert(Initializer.caught == "static" && caught == "local");
}
