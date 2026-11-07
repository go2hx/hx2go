package unit;

private class Initializer {
    public static var ok = {
        var name = "Windows";
        switch (name) {
            case "Windows": "win64";
            case "Linux": "linux64";
            default: throw "Unsupported platform!";
        }
    };
}

function main() {
    assert(Initializer.ok == "win64");
}
