import go.net.Http;
import go.net.http.Dir;

function main() {
	var port = ":8082";
	trace('http file server: http://localhost$port');

	var dir:Dir = ".";
	var err = Http.listenAndServe(port, Http.fileServer(dir));
	trace(err);
	// NOTE: the server will continue to run until interrupted.
	// Polite shutdown is beyond the scope of this simple example.
}
