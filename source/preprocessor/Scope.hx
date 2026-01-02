package preprocessor;

@:structInit
class Scope {

    private var _variables: Map<String, String> = [];

    public function defineVariable(name: String, ctx: Preprocessor): String {
        var n: String = name;
        if (_variables.exists(name)) n = '_${name}_${ctx.annonymiser.allocId()}';

        _variables.set(name, n);
        return n;
    }

    public function hasVariable(name: String): Bool {
        return _variables.exists(name);
    }

    public function getAlias(name: String): String {
        var alias = _variables.get(name);
        if (alias == null) {
            return name;
        }

        return alias;
    }

    public function copy(): Scope {
        return {
            _variables: _variables.copy()
        }
    }

}
