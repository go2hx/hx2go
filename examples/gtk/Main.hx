import go.github_com.diamondburned.gotk4.pkg.gtk.v4.Gtk;
import go.github_com.diamondburned.gotk4.pkg.gtk.v4.Application;

class Main {
	static function main() {
		var app = Gtk.newApplication("com.github.diamondburned.gotk4-examples.gtk4.simple", 0b0);
		app.connectActivate(() -> {
			activate(app);
		});
		app.run([]);
	}

	static function activate(app:Application) {
		var window = Gtk.newApplicationWindow(app);
		window.setTitle("gotk4 Example");
		window.setChild(Gtk.newLabel("Hello from Go!"));
		window.setDefaultSize(400, 300);
		window.show();
	}
}