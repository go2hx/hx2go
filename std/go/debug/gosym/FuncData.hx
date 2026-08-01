package go.debug.gosym;

@:structInit
@:go.Type({ name: "funcData", instanceName: "gosym.funcData", imports: ["debug/gosym"] })
extern class FuncData {

    @:native("IsZero") function isZero(): (Bool);

}