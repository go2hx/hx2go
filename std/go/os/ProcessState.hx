package go.os;

@:go.TypeAccess({name: "os.ProcessState", imports: ["os"]})
extern class ProcessState {
	/**
		ExitCode returns the exit code of the exited process, or -1 if the process hasn't exited or was terminated by a signal.
	**/
	function exitCode():Int;
}
