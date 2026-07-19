function main() {
    var args = Sys.args();
    if (args.length > 0) {
        var commands = args[0].split(":");
        if (commands.length > 1) {
            runCommands(commands);
        }
    }
}

function runCommands(commands:Array<String>) {
    switch commands[0] {
        case "task":
            switch commands[1] {
                case "migrate":
                    migrate();
            }
    }
}

function migrate() {
    Sys.command("haxelib run go2hx std ./std");
}