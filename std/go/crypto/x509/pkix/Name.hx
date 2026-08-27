package go.crypto.x509.pkix;

@:structInit
@:go.Type({ name: "Name", instanceName: "pkix.Name", imports: ["crypto/x509/pkix"] })
extern class Name {

    @:native("Country") var country: go.Slice<String>;
    @:native("Organization") var organization: go.Slice<String>;
    @:native("OrganizationalUnit") var organizationalUnit: go.Slice<String>;
    @:native("Locality") var locality: go.Slice<String>;
    @:native("Province") var province: go.Slice<String>;
    @:native("StreetAddress") var streetAddress: go.Slice<String>;
    @:native("PostalCode") var postalCode: go.Slice<String>;
    @:native("SerialNumber") var serialNumber: String;
    @:native("CommonName") var commonName: String;
    @:native("Names") var names: go.Slice<go.crypto.x509.pkix.AttributeTypeAndValue>;
    @:native("ExtraNames") var extraNames: go.Slice<go.crypto.x509.pkix.AttributeTypeAndValue>;

    function new(country: go.Slice<String>=null, organization: go.Slice<String>=null, organizationalUnit: go.Slice<String>=null, locality: go.Slice<String>=null, province: go.Slice<String>=null, streetAddress: go.Slice<String>=null, postalCode: go.Slice<String>=null, serialNumber: String="", commonName: String="", names: go.Slice<go.crypto.x509.pkix.AttributeTypeAndValue>=null, extraNames: go.Slice<go.crypto.x509.pkix.AttributeTypeAndValue>=null);

    @:native("FillFromRDNSequence") function fillFromRDNSequence(rdns: go.Pointer<go.crypto.x509.pkix.RDNSequence>): Void;
    @:native("String") function string(): (String);
    @:native("ToRDNSequence") function toRDNSequence(): (go.crypto.x509.pkix.RDNSequence);

}