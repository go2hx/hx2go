import go.Tuple;
import go.Fmt;
import go.GoInt;
import go.Go;

@:go.TypeAccess({ name: "error" })
extern class Error {}

@:go.TypeAccess({ name: "*os.File", imports: ["os"] })
extern class File {}

@:go.TypeAccess({ name: "os", imports: ["os"] })
extern class OS {
    static function open(path: String): Tuple<{ handle: File, err: Error }>;
}

@:go.TypeAccess({ name: "time", imports: ["time"] })
extern class Time {
    static var second: Duration;
    static function duration(v: GoInt): Duration; // turns into `time.Duration` which is a cast.
}

@:coreType
@:go.TypeAccess({ name: "beep.SampleRate", imports: ["github.com/faiface/beep"] })
extern abstract Duration {
    @:op(A / B) public function div(x: Duration): Duration;
}

@:go.TypeAccess({ name: "beep.StreamSeekCloser", imports: ["github.com/faiface/beep"] })
extern class Streamer {
    public function len(): GoInt;
    public function position(): GoInt;
    public function seek(pos: GoInt): Error;
    public function close(): Error;
}

@:go.TypeAccess({ name: "beep.Format", imports: ["github.com/faiface/beep"] })
extern class Format {
    var sampleRate: SampleRate;
    var numChannels: GoInt;
    var precision: GoInt;
}

@:go.TypeAccess({ name: "mp3", imports: ["github.com/faiface/beep/mp3"] })
extern class MP3 {
    static function decode(file: File): Tuple<{ streamer: Streamer, format: Format, err: Error }>;
}

@:go.TypeAccess({ name: "speaker", imports: ["github.com/faiface/beep/speaker"] })
extern class Speaker {
    static function clear(): Void;
    static function close(): Void;
    static function init(sampleRate: SampleRate, bufferSize: GoInt): Error;
    static function lock(): Void;
    static function unlock(): Void;
    static function play(streamer: Streamer): Void; // todo: make rest
}

@:go.TypeAccess({ name: "beep.SampleRate", imports: ["github.com/faiface/beep"] })
extern class SampleRate {
    public function N(duration: Duration): GoInt;
}

@:go.TypeAccess({ name: "beep", imports: ["github.com/faiface/beep"] })
extern class Beep {
    static function sampleRate(rate: GoInt): SampleRate;
}

class Test {

    public static function main(): Void {
        var path = "/home/mikaib/Music/audio.mp3";

        var file = OS.open(path);
        if (file.err != null) {
            Fmt.println("Error opening file: ", file.err);
            return;
        }

        var dec = MP3.decode(file.handle);
        if (dec.err != null) {
            Fmt.println("Error decoding mp3: ",  dec.err);
            return;
        }

        var err = Speaker.init(dec.format.sampleRate, dec.format.sampleRate.N(Time.second / Time.duration(10)));
        if (err != null) {
            Fmt.println("Error initializing speaker: ", err);
            return;
        }

        Speaker.play(dec.streamer);

        while (dec.streamer.position() < dec.streamer.len()) {
            Fmt.println(dec.streamer.position(), " / ", dec.streamer.len());
        }

        dec.streamer.close();
    }

}

