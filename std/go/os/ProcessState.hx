package go.os;

@:go.Type({ name: "os.ProcessState", imports: ["os"] })
extern class ProcessState {
    function exitCode(): Int;
}