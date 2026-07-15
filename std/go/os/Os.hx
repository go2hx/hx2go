package go.os;

@:go.Type({ name: "os", imports: ["os"] })
extern class Os {

    public static var Args: Slice<String>;

    static function getwd(): Result<String>;
    static function chdir(dir: String): Error;
    static function getenv(key: String): String;
    static function exit(code: Int): Void;
    static function environ(): Slice<String>;
    static function setenv(key: String, value: String): Error;
    static function unsetenv(key: String): Error;
    static function readFile(name: String): Result<go.Slice<Byte>>;
    static function mkdirAll(path: String, perm: Int): Error;
    static function writeFile(name: String, content: Slice<Byte>, perm: Int): Error;

}