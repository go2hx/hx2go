package;

@:forward
abstract CoolString(String) from String to String {

    public function logIt(): Void {
        trace('from CoolString', this, abstract);
    }

}
