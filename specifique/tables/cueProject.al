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
            Caption = 'NumberTechnician';
            FieldClass = FlowField;
            CalcFormula = Count(Technicien);
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