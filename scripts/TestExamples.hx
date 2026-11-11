function main() {
	for (dir in sys.FileSystem.readDirectory("examples")) {
		// skip for CI
		switch dir {
			case "miqt", "gtk", "http_fileserver", "ebiten":
				continue;
			default:
		}
		// run
		var args = ["haxe", 'haxe examples/$dir/build.hxml', '--macro', 'include("go")'];
		Sys.println(args.join(" "));
		var code = Sys.command(args.shift(), args);
		if (code != 0)
			Sys.exit(code);
	}
}
