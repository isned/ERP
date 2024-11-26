table 60000 "Technicien"
{
    DataClassification = ToBeClassified;
    Caption = 'Technicien';

    fields
    {
        field(1; Id; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Technician ID';
        }
        field(2; FirstName; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'First Name';
        }
        field(3; LastName; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Last Name';
        }
        field(4; Status; Enum "Disponibility Status")
        {
            DataClassification = ToBeClassified;
            Caption = 'Status';
        }
    }


    keys
    {
        key(Key1; Id)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here if necessary
    }

    trigger OnInsert()
    begin
        // Custom logic when inserting a new technician
    end;

    trigger OnModify()
    begin
        // Custom logic when modifying a technician
    end;

    trigger OnDelete()
    begin
        // Custom logic when deleting a technician
    end;

    trigger OnRename()
    begin
        // Custom logic when renaming a technician
    end;
}


