package go.time;

@:go.Type({ name: "time.Time", imports: ["time"] })
extern class TimeInstance {

    function unix(): Int64;
    function unixMilli(): Int64;
    function unixMicro(): Int64;
    function unixNano(): Int64;
    function local(): TimeInstance;
    @:go.Tuple("name", "offset") public function zone(): Tuple<{ name:String, offset:Int }>;

}
