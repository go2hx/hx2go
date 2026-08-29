function main() {
    for (dir in sys.FileSystem.readDirectory("examples")) {
        // skip
        if (dir == "miqt" || dir == "gtk") {
            continue;
        }
        // run
        var code = Sys.command('haxe examples/$dir/build.hxml');
        if (code != 0)
            Sys.exit(code);
    }
}