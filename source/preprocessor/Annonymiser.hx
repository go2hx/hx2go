package preprocessor;

@:structInit
/**
 * Given any expression the annonymiser will get rid of all identifyable expressions and replace them with temporaries.
 * All usages will also be modified by the annonymiser.
 * `var myVar = 5;` -> `var _temp_0 = 5;`
 * The following should have support added once we add local functions.
 * `function foo() {}` -> `function _temp_0() {}`
 */
class Annonymiser {

    private var _tempId: Int = 0;

    /**
     * Annonymises a given expression and it's children.
     * @param e The expression to annonymise.
     */
    public function annonymise(e: HaxeExpr) {
        iter(e, []);
    }

    /**
     * Returns the temporary name for any given ID.
     * @param id The ID of the temporary.
     */
    private function getName(id: Int): String {
        return '_temp_$id';
    }

    /**
     * Creates a new temporary, registers it in the mapping and returns the name
     * @param original The original name of the variable.
     * @param mapping The mapping in which aliases are stored.
     */
    private function createTemporary(original: String, mapping: Map<String, String>): String {
        var id = _tempId++;
        var name = getName(id);

        mapping[original] = name;
        return name;
    }

    /**
     * Given a variable name, it will return the alias in the mapping or otherwise the original name.
     * @param name The variable name.
     * @param mapping The mapping in which aliases are stored.
     */
    private function getMapping(name: String, mapping: Map<String, String>): String {
        return mapping[name] ?? name;
    }

    /**
     * Interal iteration of the annonymiser, iterates over self and children.
     * @param e The expression.
     * @param mapping The mapping in which alises are stored, at the depth for own's iteration.
     */
    private function iter(e: HaxeExpr, mapping: Map<String, String>): Void {
        switch e.def {
            case EVars(vars):
                for (v in vars) {
                    if (v.annonymous == true) {
                        continue;
                    }

                    v.name = createTemporary(v.name, mapping);
                    v.annonymous = true;
                }

            case EConst(CIdent(x)):
                e.def = EConst(CIdent(getMapping(x, mapping)));

            case _: null;
        }

        HaxeExprTools.iter(e, iter.bind(_, mapping.copy()));
    }

}
