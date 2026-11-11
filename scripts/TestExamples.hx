function main() {
	for (dir in sys.FileSystem.readDirectory("examples")) {
		// skip for CI
		switch dir {
			case "miqt", "gtk", "http_fileserver", "ebiten":
				continue;
			default:
		}
		// run
		var command = 'haxe examples/$dir/build.hxml --macro include(\'go\')';
		Sys.println(command);
		var code = Sys.command(command);
		if (code != 0)
			Sys.exit(code);
	}
}
