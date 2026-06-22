package go.reflect;

@:go.Type({name: "reflect.Type", imports: ["reflect"]})
extern class Type {
    function kind():Kind;
}
