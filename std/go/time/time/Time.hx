package go.time.time;

// AI generated comment below, mostly right...
// This files contains the Time class which is a member of the time package but is not the same as the Time class in the time package, which is in Time.hx. This is because the Time class in Time.hx has some static functions that return a Time, and we need to avoid a circular reference. So this file contains the instance methods of Time, while Time.hx contains the static methods of Time.
@:go.TypeAccess({name: "time.Time", imports: ["time"]})
extern class Time {
	// TODO: this extern is incomplete - https://pkg.go.dev/time
	public function unixNano():go.Int64;
	public function local():Time;
	@:go.Tuple("name", "offset") public function zone():go.Tuple<{name:String, offset:Int}>;
}
