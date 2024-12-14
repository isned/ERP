tableextension 60311 "BC Sales & Receivables Setup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(60312; IdMaintenance; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Maintenance ID';
            Editable = false;

        }

        field(60313; "Maintenance Nos."; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Maintenance Number';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}