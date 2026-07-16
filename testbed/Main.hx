import go.Image;
import go.image.color.RGBA;
import go.bytes.Buffer;
import go.Pointer;
import go.image.Png;
import go.Os;

function main() {
    var width = 512;
    var height = 512;
    var img = Image.newRGBA(Image.rect(0, 0, width, height));

    for (x in 0...width) {
        var t = x / width - 1;
        var r = Std.int(255 * (1 - t));
        var g = Std.int(255 * t);

        for (y in 0...height) {
            img.set(x, y, new RGBA(r, g, 0, 255));
        }
    }

    var buf: Buffer = null;

    Png.encode(buf, img).sure();
    Os.writeFile("./output.png", buf.bytes(), Os.ModePerm);
}