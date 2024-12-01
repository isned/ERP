tableextension 65965 "BC ServiceContracts" extends "Service Contract Header"
{
    fields
    {
        field(65966; IdMaintenance; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Maintenance Code';
            TableRelation = "Maintenance Request".IdMaintenance; // Relation avec Maintenance Request
        }
        field(65967; DescriptionMaintenance; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Maintenance Description';
        }
        field(65968; CustomStatus; Enum "Custom Status")
        {
            Caption = 'Custom Status';
            DataClassification = ToBeClassified;
        }

    }
}
