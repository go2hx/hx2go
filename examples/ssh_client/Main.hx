import go.Byte;
import go.Error;
import go.GoInt;
import go.Pointer;
import go.Slice;
import go.Syntax;
import go.Tuple;
import go.fyne_io.fyne.v2.App_ as App;
import go.fyne_io.fyne.v2.Container_ as Container;
import go.fyne_io.fyne.v2.Fyne;
import go.fyne_io.fyne.v2.Widget_ as Widget;
import go.github_com.fyne_io.Terminal;
import go.golang_org.x.crypto.Ssh;
import go.golang_org.x.crypto.ssh.Client;
import go.golang_org.x.crypto.ssh.ClientConfig;
import go.io.Reader;
import go.io.WriteCloser;
import go.sync.Mutex;

class FixEscapes {

    var target: WriteCloser;
    var lock: Mutex;
    var escapePending: Bool = false;

    public function new(target: WriteCloser) {
        this.target = target;
    }

    @:go.Export
    @:go.Tuple('n', 'err')
    public function write(p: Slice<Byte>): Tuple<{ n: GoInt, err: Error }> {
        lock.lock();

        if (escapePending) {
            target.write('\x1b' + p);
            escapePending = false;
        } else if (p == '\x1b') escapePending = true;
          else target.write(p);

        lock.unlock();

        return { n: p.length, err: null };
    }

    @:go.Export
    public function close(): Error {
        return target.close();
    }

}

function main() {
    var window = App._new().newWindow('hx2go ssh');

    var host = Widget.newEntry();
    host.setPlaceHolder('host:22');

    var user = Widget.newEntry();
    user.setPlaceHolder('user');

    var pass = Widget.newPasswordEntry();
    pass.setPlaceHolder('password');

    var status = Widget.newLabel('not connected');
    var screen = Container.newStack();
    var client: Pointer<Client> = null;

    function disconnect() {
        if (client == null) return;
        client.close();
        client = null;
        status.setText('disconnected');
    }

    function connect() {
        disconnect();

        var config: ClientConfig = untyped {
            user: user.text,
            auth: [Ssh.password(pass.text)],
            hostKeyCallback: Ssh.insecureIgnoreHostKey()
        };

        var dial = Ssh.dial('tcp', host.text, config).tuple();
        if (dial.error != null) {
            status.setText('connect failed: ${dial.error.error()}');
            return;
        }

        var current = dial.result;
        client = current;

        var session = current.newSession().sure();
        session.requestPty('xterm-256color', 24, 80, null);

        var input: WriteCloser = cast new FixEscapes(session.stdinPipe().sure());
        var output: Reader = session.stdoutPipe().sure();
        session.shell();

        var term = Terminal._new();
        screen.removeAll();
        screen.add(term);
        window.canvas().focus(term);
        status.setText('connected to ${host.text}');

        Syntax.go(() -> {
            term.runWithConnection(input, output);
            Fyne._do(() -> if (client == current) disconnect());
        });
    }

    var login = Container.newGridWithColumns(5, host, user, pass, Widget.newButton('Connect', connect), Widget.newButton('Disconnect', disconnect));
    window.setContent(Container.newBorder(login, status, null, null, screen));
    window.resize(Fyne.newSize(760, 480));
    window.showAndRun();
}