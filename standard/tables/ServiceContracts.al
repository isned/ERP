tableextension 65965 "BC ServiceContracts" extends "Service Contract Header"
{
    fields
    {
        // Add changes to table fields here

        field(65966; IdMaintenance; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Maintenance Code';
            TableRelation = "Maintenance Request".IdMaintenance;
        }
        field(65967; DescriptionMaintenance; text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Department Description';
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