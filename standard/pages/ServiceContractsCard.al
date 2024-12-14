pageextension 66050 "BC ServiceContractsCard" extends "Service Contract"
{
    layout
    {
        addafter(Description)
        {
            field(CustomerNo; Rec."Customer No.")
            {
                ApplicationArea = All;
                trigger OnValidate()
                var
                    Maintenance: Record "MaintenanceRequest";
                begin
                    // Rechercher une maintenance associée au client
                    if Maintenance.GetMaintenanceByCustomer(Rec."Customer No.") then begin
                        Rec.IdMaintenance := Maintenance.IdMaintenance;
                        Rec.DescriptionMaintenance := Maintenance.DescriptionMaintenance;
                        Rec.TotalMaintenance := Maintenance.TotalMaintenance;
                    end else begin
                        // Effacer les champs si aucune maintenance n'est trouvée
                        Clear(Rec.IdMaintenance);
                        Clear(Rec.DescriptionMaintenance);
                        Clear(Rec.TotalMaintenance);
                        Message('No maintenance found for the selected customer.');
                    end;
                end;
            }

            field(IdMaintenance; Rec.IdMaintenance)
            {
                ApplicationArea = All;
                trigger OnValidate()
                var
                    Maintenance: Record "MaintenanceRequest";
                begin
                    // Vérifier si l'ID de maintenance existe
                    if Maintenance.Get(Rec.IdMaintenance) then begin
                        Rec.DescriptionMaintenance := Maintenance.DescriptionMaintenance;
                        Rec.TotalMaintenance := Maintenance.TotalMaintenance;
                    end else begin
                        Clear(Rec.DescriptionMaintenance);
                        Error('Invalid Maintenance ID.');
                    end;
                end;
            }

            field(DescriptionMaintenance; Rec.DescriptionMaintenance)
            {
                ApplicationArea = All;
                Editable = false; // Champ non modifiable
            }
            field(TotalMaintenance; Rec.TotalMaintenance)
            {
                ApplicationArea = All;
                Editable = false; // Champ non modifiable

            }

            field(CustomStatus; Rec.CustomStatus)
            {
                ApplicationArea = All;

            }

        }

        modify(Status)
        {
            Visible = false; // Cacher le champ "Status" par défaut
        }
        modify("Customer No.")
        {
            Visible = false; // Cacher le champ "Status" par défaut
        }
    }
}

