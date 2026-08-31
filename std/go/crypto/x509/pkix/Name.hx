package go.crypto.x509.pkix;

/**
    Name represents an X.509 distinguished name. This only includes the common
    elements of a DN. Note that Name is only an approximation of the X.509
    structure. If an accurate representation is needed, asn1.Unmarshal the raw
    subject or issuer as an [RDNSequence].
**/
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

    /**
        FillFromRDNSequence populates n from the provided [RDNSequence].
        Multi-entry RDNs are flattened, all entries are added to the
        relevant n fields, and the grouping is not preserved.
    **/
    @:native("FillFromRDNSequence") function fillFromRDNSequence(rdns: go.Pointer<go.crypto.x509.pkix.RDNSequence>): Void;
    /**
        String returns the string form of n, roughly following
        the RFC 2253 Distinguished Names syntax.
    **/
    @:native("String") function string(): (String);
    /**
        ToRDNSequence converts n into a single [RDNSequence]. The following
        attributes are encoded as multi-value RDNs:
        
          - Country
          - Organization
          - OrganizationalUnit
          - Locality
          - Province
          - StreetAddress
          - PostalCode
        
        Each ExtraNames entry is encoded as an individual RDN.
    **/
    @:native("ToRDNSequence") function toRDNSequence(): (go.crypto.x509.pkix.RDNSequence);

}