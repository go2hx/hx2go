import haxe.io.Bytes;

function main() {
    trace(new haxe.crypto.Hmac(SHA256).make(Bytes.ofString("secret"), Bytes.ofString("Hello")).toHex());
}