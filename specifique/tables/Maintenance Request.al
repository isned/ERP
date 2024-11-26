table 60002 "Maintenance Request"
{
    DataClassification = ToBeClassified;
    Caption = 'Maintenance Request';

    fields
    {
        field(1; IdMaintenance; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Maintenance ID';
        }
        field(2; Date; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Maintenance Date';
        }







        field(60003; TechnicianId; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Technician ID';
            TableRelation = Technicien.Id;
        }


        field(60004; FirstName; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Technician First Name';
            TableRelation = Technicien.FirstName;
        }

        field(60005; LastName; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Technician Last Name';
            TableRelation = Technicien.LastName;
        }

        field(60006; Status; Enum "Disponibility Status")
        {
            Caption = 'Technician Status';
            FieldClass = FlowField;
            CalcFormula = lookup(Technicien.Status where(Id = field(TechnicianId)));
        }

    }

    keys
    {
        key(Key1; IdMaintenance)
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        // Custom logic when inserting a new maintenance request
    end;

    trigger OnModify()
    begin
        // Custom logic when modifying a maintenance request
    end;

    trigger OnDelete()
    begin
        // Custom logic when deleting a maintenance request
    end;

    trigger OnRename()
    begin
        // Custom logic when renaming a maintenance request
    end;
}