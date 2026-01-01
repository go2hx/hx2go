class Util {
    public static function normalizeCLRF(text:String):String {
        text = StringTools.replace(text, "\r\n", "\n");
        text = StringTools.replace(text, "\r", "\n");
        return text;
    }
}