table 60001 cueProject
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PrimaryKey; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; NumberTechnician; Integer)
        {
            Caption = 'Number Technician';
            FieldClass = FlowField;
            CalcFormula = Count(Technicien);

        }
        field(3; NumberTechnicianAvailable; Integer)
        {
            Caption = 'Number of Technicians Available';
            FieldClass = FlowField;
            CalcFormula = Count(Technicien where(Status = const(Available)));
        }

        field(4; NumberTechnicianBusy; Integer)
        {
            Caption = 'Number of Technicians Busy';
            FieldClass = FlowField;
            CalcFormula = Count(Technicien where(Status = const(Busy)));
        }

    }

    keys
    {
        key(Key1; PrimaryKey)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}