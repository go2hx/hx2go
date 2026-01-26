package go.tinygo;

#if tinygo

#if (tinygo.target == "arduino")
    typedef Machine = go.tinygo.impl.ArduinoMachine;
#else
    #error "Unsupported 'tinygo.target' define, see /hx2go/std/go/tinygo/Machine.hx for a list of supported targets."
#end

#end
