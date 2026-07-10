package unit;


private interface IResource {
    public function dispose(): String;
}

private class Texture implements IResource {
    public var path: String;

    public function new(path: String) {
        this.path = path;
    }

    public function dispose(): String {
        return 'texture disposed';
    }
}

private class Sound implements IResource {
    public var path: String;

    public function new(path: String) {
        this.path = path;
    }

    public function dispose(): String {
        return 'sound disposed';
    }
}

private class Sample extends Sound implements IResource {
    override public function dispose(): String {
        return 'sample disposed';
    }
}

function main() {
    var texture = new Texture("image.png");
    var sound = new Sound("audio.mp3");
    var sample = new Sample("sfx.wav");

    assert(texture.dispose() == "texture disposed");
    assert(sound.dispose() == "sound disposed");
    assert(sample.dispose() == "sample disposed");

    var resources: Array<IResource> = [texture, sound, sample];
    assert(resources.length == 3);
}
