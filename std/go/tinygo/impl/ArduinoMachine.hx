package go.tinygo.impl;

#if (tinygo && tinygo.target == "arduino")

@:go.TypeAccess({ name: "machine", imports: ["machine"] })
extern class ArduinoMachine {

    // TODO: this extern is incomplete - https://tinygo.org/docs/reference/microcontrollers/machine/arduino
    // TODO: I2C, SPI and generic constants.

    // pin constants
    static var D0: Pin;
    static var D1: Pin;
    static var D2: Pin;
    static var D3: Pin;
    static var D4: Pin;
    static var D5: Pin;
    static var D6: Pin;
    static var D7: Pin;
    static var D8: Pin;
    static var D9: Pin;
    static var D10: Pin;
    static var D11: Pin;
    static var D12: Pin;
    static var D13: Pin;

    // adc pins
    static var ADC0: Pin;
    static var ADC1: Pin;
    static var ADC2: Pin;
    static var ADC3: Pin;
    static var ADC4: Pin;
    static var ADC5: Pin;

    // uart pins
    static var UART_TX_PIN: Pin;
    static var UART_RX_PIN: Pin;

    // onboard LED pin
    static var LED: Pin;

    // pin modes
    static var pinOutput: PinMode;
    static var pinInput: PinMode;
    static var pinInputPullup: PinMode;

    // functions
    function CPUFrequency(): UInt32;
    function initADC(): Void;
    function initSerial(): Void;
    function newRingBuffer(): RingBuffer;

}

#end
