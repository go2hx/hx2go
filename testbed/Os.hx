package;

import go.Result;
import go.Error;

@:go.TypeAccess({name: "os", imports: ["os"]})
extern class Os {
    static function getwd(): Result<String, Error>;
}
