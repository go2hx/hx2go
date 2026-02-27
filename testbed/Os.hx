package;

import go.Error;
import go.Tuple;

@:go.TypeAccess({name: "os", imports: ["os"]})
extern class Os {
    @:go.Tuple("cwd", "err") static function getwd(): Tuple<{ cwd: String, err: Error }>;
}
