package go.golang_org.x;

/**
    Package term provides support functions for dealing with terminals, as
    commonly found on UNIX systems.
    
    Putting a terminal into raw mode is the most common requirement:
    
    	oldState, err := term.MakeRaw(int(os.Stdin.Fd()))
    	if err != nil {
    	        panic(err)
    	}
    	defer term.Restore(int(os.Stdin.Fd()), oldState)
    
    Note that on non-Unix systems os.Stdin.Fd() may not be 0.
**/
@:go.Type({ name: "term", instanceName: "term.term", imports: ["golang.org/x/term"] })
extern class Term {

    /**
        ErrPasteIndicator may be returned from ReadLine as the error, in addition
        to valid line data. It indicates that bracketed paste mode is enabled and
        that the returned line consists only of pasted data. Programs may wish to
        interpret pasted data more literally than typed data.
    **/
    @:native("ErrPasteIndicator") static var errPasteIndicator: go.golang_org.x.term.PasteIndicatorError;

    /**
        GetSize returns the visible dimensions of the given terminal.
        
        These dimensions don't include any scrollback buffer height.
    **/
    @:go.Tuple("width", "height", "err") @:native("GetSize") static function getSize(fd: go.GoInt): (go.Tuple<{ width: go.GoInt, height: go.GoInt, err: go.Error }>);
    /**
        GetState returns the current state of a terminal which may be useful to
        restore the terminal after a signal.
    **/
    @:native("GetState") static function getState(fd: go.GoInt): (go.Result<go.Pointer<go.golang_org.x.term.State>>);
    /**
        IsTerminal returns whether the given file descriptor is a terminal.
    **/
    @:native("IsTerminal") static function isTerminal(fd: go.GoInt): (Bool);
    /**
        MakeRaw puts the terminal connected to the given file descriptor into raw
        mode and returns the previous state of the terminal so that it can be
        restored.
    **/
    @:native("MakeRaw") static function makeRaw(fd: go.GoInt): (go.Result<go.Pointer<go.golang_org.x.term.State>>);
    /**
        NewTerminal runs a VT100 terminal on the given ReadWriter. If the ReadWriter is
        a local terminal, that terminal must first have been put into raw mode.
        prompt is a string that is written at the start of each input line (i.e.
        "> ").
    **/
    @:native("NewTerminal") static function newTerminal(c: go.io.ReadWriter, prompt: String): (go.Pointer<go.golang_org.x.term.Terminal>);
    /**
        ReadPassword reads a line of input from a terminal without local echo.  This
        is commonly used for inputting passwords and other sensitive data. The slice
        returned does not include the \n.
    **/
    @:native("ReadPassword") static function readPassword(fd: go.GoInt): (go.Result<go.Slice<go.Byte>>);
    /**
        Restore restores the terminal connected to the given file descriptor to a
        previous state.
    **/
    @:native("Restore") static function restore(fd: go.GoInt, oldState: go.Pointer<go.golang_org.x.term.State>): (go.Error);

}