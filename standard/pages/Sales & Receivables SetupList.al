pageextension 60459 "BC SalesList" extends "Sales & Receivables Setup"
{




    layout
    {
        addafter("Customer Nos.")
        { field("Maintenance Nos."; Rec."Maintenance Nos.") { ApplicationArea = all; } }
    }

    actions
    {

    }

    var
        myInt: Integer;
}