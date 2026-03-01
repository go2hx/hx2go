package;

import go.Result;

@:go.TypeAccess({name: "os", imports: ["os"]})
extern class Os {
    static function getwd(): Result<String>;
}
