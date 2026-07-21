package go.syscall;

@:structInit
@:go.Type({ name: "IfData", instanceName: "syscall.IfData", imports: ["syscall"] })
extern class IfData {

    @:native("Type") var type: go.UInt8;
    @:native("Typelen") var typelen: go.UInt8;
    @:native("Physical") var physical: go.UInt8;
    @:native("Addrlen") var addrlen: go.UInt8;
    @:native("Hdrlen") var hdrlen: go.UInt8;
    @:native("Recvquota") var recvquota: go.UInt8;
    @:native("Xmitquota") var xmitquota: go.UInt8;
    @:native("Unused1") var unused1: go.UInt8;
    @:native("Mtu") var mtu: go.UInt32;
    @:native("Metric") var metric: go.UInt32;
    @:native("Baudrate") var baudrate: go.UInt32;
    @:native("Ipackets") var ipackets: go.UInt32;
    @:native("Ierrors") var ierrors: go.UInt32;
    @:native("Opackets") var opackets: go.UInt32;
    @:native("Oerrors") var oerrors: go.UInt32;
    @:native("Collisions") var collisions: go.UInt32;
    @:native("Ibytes") var ibytes: go.UInt32;
    @:native("Obytes") var obytes: go.UInt32;
    @:native("Imcasts") var imcasts: go.UInt32;
    @:native("Omcasts") var omcasts: go.UInt32;
    @:native("Iqdrops") var iqdrops: go.UInt32;
    @:native("Noproto") var noproto: go.UInt32;
    @:native("Recvtiming") var recvtiming: go.UInt32;
    @:native("Xmittiming") var xmittiming: go.UInt32;
    @:native("Lastchange") var lastchange: go.syscall.Timeval32;
    @:native("Unused2") var unused2: go.UInt32;
    @:native("Hwassist") var hwassist: go.UInt32;
    @:native("Reserved1") var reserved1: go.UInt32;
    @:native("Reserved2") var reserved2: go.UInt32;

    function new(type: go.UInt8, typelen: go.UInt8, physical: go.UInt8, addrlen: go.UInt8, hdrlen: go.UInt8, recvquota: go.UInt8, xmitquota: go.UInt8, unused1: go.UInt8, mtu: go.UInt32, metric: go.UInt32, baudrate: go.UInt32, ipackets: go.UInt32, ierrors: go.UInt32, opackets: go.UInt32, oerrors: go.UInt32, collisions: go.UInt32, ibytes: go.UInt32, obytes: go.UInt32, imcasts: go.UInt32, omcasts: go.UInt32, iqdrops: go.UInt32, noproto: go.UInt32, recvtiming: go.UInt32, xmittiming: go.UInt32, lastchange: go.syscall.Timeval32, unused2: go.UInt32, hwassist: go.UInt32, reserved1: go.UInt32, reserved2: go.UInt32);

}