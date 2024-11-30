pageextension 69322 "BC ServiceContractsList" extends "Service Contract List"
{
    layout
    {
        // Add changes to page layout here
        addafter("Description")
        {
            field(IdMaintenance; Rec.IdMaintenance)
            {
                ApplicationArea = all;

            }
            field(MaintenanceDescription; Rec.DescriptionMaintenance)
            {
                ApplicationArea = all;
            }



        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}