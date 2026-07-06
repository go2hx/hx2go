package go.os.exec;

import go.os.ProcessState;

@:go.Type({ name: "exec.ExitError", imports: ["os/exec"] })
extern class ExitError {
    var processState: ProcessState;
}