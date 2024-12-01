pageextension 69321 "BC ServiceContractsList" extends "Service Contracts"
{
    layout
    {
        addafter("Description") // Ajout après le champ "Description"
        {
            field(IdMaintenance; Rec.IdMaintenance)
            {
                ApplicationArea = All; // Rendre le champ visible dans toutes les zones d'application
            }
            field(MaintenanceDescription; Rec.DescriptionMaintenance)
            {
                ApplicationArea = All; // Rendre le champ visible dans toutes les zones d'application
            }
            field(CustomStatus; Rec.CustomStatus)
            {
                ApplicationArea = All;

            }
            field(TotalMaintenance; Rec.TotalMaintenance)
            {
                ApplicationArea = All;

            }
        }
    }


}
