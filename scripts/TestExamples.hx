function main() {
	for (dir in sys.FileSystem.readDirectory("examples")) {
		// env vars
		Sys.putEnv("GOEXPERIMENT", "simd"); // note: may be emulated on some platforms (e.g. apple silicon)

		// skip for CI
		switch dir {
			case "miqt", "gtk", "http_fileserver", "ebiten", "ssh_client", "bluetooth", "ollama":
				continue;
			default:
		}
		// run
		var args = ["haxe", 'examples/$dir/build.hxml', '--macro', 'include("go")'];
		Sys.println(args.join(" "));
		var code = Sys.command(args.shift(), args);
		if (code != 0)
			Sys.exit(code);
	}
}
