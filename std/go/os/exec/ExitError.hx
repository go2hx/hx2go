package go.os.exec;

import go.os.ProcessState;

// TODO implemnt more of os/exec
// https://pkg.go.dev/os/exec

@:go.TypeAccess({name: "exec.ExitError", imports: ["os/exec"]})

extern class ExitError extends Error {
    /**
        ProcessState contains information about an exited process, available after a call to Wait or Run.
    **/
    var processState:ProcessState;
}