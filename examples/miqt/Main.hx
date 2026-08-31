import go.github_com.mappu.miqt.Qt;
import go.Os;

function main() {
    Qt.newQApplication(Os.args);

    var btn = Qt.newQPushButton3("Hello World!");
    btn.setFixedWidth(320);

    var counter = 0;
    btn.onPressed(() -> {
        counter++;
        btn.setText('You have clicked the button $counter time(s)!');
    });

    btn.show();

    Qt.qApplication_Exec();
}