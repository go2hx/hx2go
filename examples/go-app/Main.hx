import go.github_com.maxence_charriere.go_app.v11.pkg.app.Handler;
import go.github_com.maxence_charriere.go_app.v11.pkg.app.Compo;
import go.github_com.maxence_charriere.go_app.v11.pkg.app.UI;
import go.github_com.maxence_charriere.go_app.v11.pkg.App;
import go.net.Http;
import go.Pointer;

class HelloComponent extends Compo {

    public var name: String;

    public function new() {
        this.name = "";
    }

    override public function render(): UI {
        return App.div().body(
            App.H1().body(
                App.text("Hello, "),
                App._if(this.name != "", function() {
                    return App.text(this.name);
                })._else(function() {
                    return App.text("World!");
                })
            ),
            App.input()
                .type("text")
                .value(this.name)
                .placeholder("What is your name?")
                .autoFocus(true)
                .onInput(this.valueTo(
                    Pointer.addressOf(this.name)
                ))
        );
    }

}

function main() {
    App.route("/", () -> new HelloComponent());
    App.runWhenOnBrowser();

    Http.handle("/", new Handler("Hello World", null, null));
    Http.listenAndServe(":8000", null).sure();
}