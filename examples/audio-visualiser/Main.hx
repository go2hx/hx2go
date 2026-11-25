import go.Slice;
import go.Float32;
import go.GoInt;
import go.Pointer;
import go.image.color.RGBA;
import go.github_com.gen2brain.raylib_go.raylib.Rl;
import go.github_com.gen2brain.raylib_go.raylib.Music;
import go.github_com.madelynnblue.go_dsp.Spectral;
import go.github_com.madelynnblue.go_dsp.spectral.PwelchOptions;

final SIZE: Int = 1024;
final BARS: Int = 64;

var samples: Slice<Float> = new Slice<Float>(SIZE);
var pos: Int = 0;

function onAudio(data: Slice<Float32>, frames: GoInt): Void {
    for (i in 0...(frames: Int)) {
        samples[pos] = data[i * 2];
        pos = (pos + 1) % SIZE;
    }
}

function main(): Void {
    Rl.initWindow(800, 450, 'visualiser');
    Rl.initAudioDevice();
    Rl.setTargetFPS(60);
    Rl.attachAudioMixedProcessor(onAudio);

    var opts: PwelchOptions = { NFFT: SIZE, window: null, pad: 0, noverlap: 0, scale_off: true };
    var music: Null<Music> = null;

    while (!Rl.windowShouldClose()) {
        if (Rl.isFileDropped()) {
            if (music != null) {
                Rl.unloadMusicStream(music);
            }

            music = Rl.loadMusicStream(Rl.loadDroppedFiles()[0]);
            Rl.playMusicStream(music);
        }

        if (music != null) {
            Rl.updateMusicStream(music);
        }

        var power: Slice<Float> = Spectral.pwelch(samples, 44100, Pointer.addressOf(opts)).Pxx;

        Rl.beginDrawing();
        Rl.clearBackground(Rl.black);

        for (b in 0...BARS) {
            var lo: Int = Std.int(Math.pow(SIZE / 2, b / BARS));
            var hi: Int = Std.int(Math.max(lo + 1, Math.pow(SIZE / 2, (b + 1) / BARS)));
            var peak: Float = 0;

            for (k in lo...hi) {
                peak = Math.max(peak, power[k]);
            }

            var height: Int = Std.int(Math.min(400, Math.sqrt(peak) * 40));
            var colour: RGBA = Rl.colorFromHSV(b * 4, 0.8, 0.9);
            Rl.drawRectangle(b * 12 + 16, 430 - height, 10, height, colour);
        }

        if (music == null) {
            Rl.drawText('drop an audio file', 300, 210, 20, Rl.gray);
        }

        Rl.endDrawing();
    }

    Rl.closeAudioDevice();
    Rl.closeWindow();
}
