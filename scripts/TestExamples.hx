function main() {
	for (dir in sys.FileSystem.readDirectory("examples")) {
		// skip
		switch dir {
			case "miqt", "gtk", "http_fileserver", "ebiten"
				continue;
		}
		// run
		var command = 'haxe examples/$dir/build.hxml';
		Sys.println(command);
		var code = Sys.command(command);
		if (code != 0)
			Sys.exit(code);
	}
}
