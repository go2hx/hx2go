import go.charm_land.bubbletea.v2.KeyPressMsg;
import go.charm_land.bubbletea.v2.KeyPressMsg;
import go.Syntax;
import go.charm_land.bubbletea.v2.Tea;
import go.charm_land.bubbletea.v2.Cmd;
import go.charm_land.bubbletea.v2.Msg;
import go.charm_land.bubbletea.v2.View;
import go.charm_land.bubbletea.v2.KeyPressMsg;
import go.charm_land.bubbletea.v2.Model as TeaModel;
import go.Fmt;
import go.Reflect;

// written with reference from: https://github.com/charmbracelet/bubbletea/blob/e4d617e7e0c0dd595cc553a856236221c678470f/examples/simple/main.go
// example of using it in Haxe: https://codeberg.org/inert_aesthetic/hx2go-bubbletea-helloworld/

function main() {
    var p = if (Sys.getEnv("CI") != null) {
        // required for continuous integration only
        Tea.newProgram(new Model(5), Tea.withInput(null), Tea.withoutRenderer());
    } else {
        // this version is only required for normal programs
        Tea.newProgram(new Model(5));
    }

    p.run().sure();
}

class Model {
    public var seconds = 0;
    public function new(seconds) {
        this.seconds = seconds;
    }

    @:go.Export
    @:go.Tuple("p0", "p1")
    public function update(msg:Msg):go.Tuple<{p0:TeaModel, p1:Cmd}> {
        var ret:go.Tuple<{p0:TeaModel, p1:Cmd}> = {p0: this, p1: null};
        Syntax.typeSwitch(msg, 
            TypeSwitch.typeCase((msg : KeyPressMsg) -> {
                switch msg.string() {
                    case "ctrl+c", "q":
                        ret = {p0: this, p1: Tea.quit};
                    case "ctrl+z":
                        ret = {p0: this, p1: Tea.suspend};
                    default:
                }
            }),
            TypeSwitch.typeCase((msg : TickMsg) -> {
                seconds--;
                if (seconds <= 0) {
                    ret = {p0: this, p1: Tea.quit};
                }else{
                    ret = {p0: this, p1: tick};
                }
            }),
        );
        return ret;
    }

    @:go.Export
    public function init():Cmd {
        return tick;
    }


    @:go.Export
    public function view():View {
        return Tea.newView(
            'This program will exit in $seconds.\n\nTo quit sooner press ctrl-c, or press ctrl-z to suspend...'
        );
    }

    public function tick():Msg {
        Sys.sleep(1);
        return new TickMsg();
    }

}

class TickMsg {
    public function new() {}
}