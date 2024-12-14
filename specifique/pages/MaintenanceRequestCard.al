page 60004 "Maintenance Request Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "MaintenanceRequest";
    Caption = 'Maintenance Request Card';

    layout
    {
        area(Content)
        {
            group(GeneralInformation)
            {
                Caption = 'General Information';

                field(IdMaintenance; Rec.IdMaintenance)
                {
                    ApplicationArea = All;
                    Caption = 'Maintenance ID';
                    Editable = false;
                }

                field(DateStart; Rec.DateStart)
                {
                    ApplicationArea = All;
                    Caption = 'Maintenance Date Start';
                }

                field(DateEnd; Rec.DateEnd)
                {
                    ApplicationArea = All;
                    Caption = 'Maintenance Date End';

                    trigger OnValidate()
                    var
                        DurationInDays: Integer;
                        Technicien: Record Technicien;
                    begin
                        // Vérifier si la DateEnd est inférieure à la DateStart
                        if Rec.DateEnd < Rec.DateStart then
                            ERROR('The End Date cannot be earlier than the Start Date.');

                        // Calculer la durée en jours
                        DurationInDays := Rec.DateEnd - Rec.DateStart;

                        // Remplir automatiquement le champ Duration
                        Rec.Duration := DurationInDays;

                        // Calculer le TotalMaintenance dès que la durée change
                        Rec.TotalMaintenance := 60 * Rec.Duration + Rec.UnitPrice;

                        // Afficher une alerte si nécessaire
                        MESSAGE('The duration has been automatically calculated as %1 day(s). Total Maintenance: %2.', DurationInDays, Rec.TotalMaintenance);

                        // Changer le statut du technicien en fonction de la DateEnd
                        if Rec.DateEnd < TODAY then begin
                            if Technicien.Get(Rec.TechnicianId) then begin
                                Technicien.Status := Technicien.Status::Available;
                                Technicien.Modify();
                            end;
                        end
                        else begin
                            if Technicien.Get(Rec.TechnicianId) then begin
                                Technicien.Status := Technicien.Status::Busy;
                                Technicien.Modify();
                            end;
                        end;

                        // Mise à jour du statut de la maintenance en fonction de la DateEnd
                        if Rec.DateEnd < TODAY then
                            Rec.StatusMaintenance := Rec.StatusMaintenance::Completed
                        else
                            Rec.StatusMaintenance := Rec.StatusMaintenance::Inprogress;
                    end;
                }

                field(Duration; Rec.Duration)
                {
                    ApplicationArea = All;
                    Caption = 'Duration';
                }

                field(Description; Rec.DescriptionMaintenance)
                {
                    ApplicationArea = All;
                    Caption = 'Maintenance Description';
                }

                field(StatusMaintenance; Rec.StatusMaintenance)
                {
                    ApplicationArea = All;
                    Caption = 'Maintenance Status';
                }

                group(detailsTechnician)
                {
                    Caption = 'Details Technician';

                    /* field(Id; Rec.TechnicianId)
                     {
                         ApplicationArea = all;

                         trigger OnValidate()
                         var
                             Technicien: Record Technicien;
                         begin
                             // Vérification si le technicien existe dans la table
                             if Technicien.Get(Rec.TechnicianId) then
                                 // Remplir les informations sur le technicien
                                 Rec.FirstName := Technicien.FirstName;
                             Rec.LastName := Technicien.LastName;
                             Rec.StatusTechnician := Technicien.Status;

                         end;

                     }*/


                    field(Id; Rec.TechnicianId)
                    {
                        ApplicationArea = All;
                        Caption = 'Technician ID';

                        // Définir la relation de la table pour filtrer par Technicien disponible
                        TableRelation = Technicien WHERE(Status = CONST(Available));

                        trigger OnValidate()
                        var
                            Technicien: Record Technicien;
                        begin
                            if Technicien.Get(Rec.TechnicianId) then begin
                                if Technicien.Status <> Technicien.Status::Available then
                                    ERROR('The selected technician is not available.');

                                Rec.FirstName := Technicien.FirstName;
                                Rec.LastName := Technicien.LastName;
                                Rec.StatusTechnician := Technicien.Status;
                            end else begin
                                ERROR('Technician with ID %1 does not exist.', Rec.TechnicianId);
                            end;
                        end;
                    }

                    field(FirstName; Rec.FirstName)
                    {
                        ApplicationArea = all;
                        // Caption = 'First Name';
                        // Editable = false; // Non éditable
                    }

                    field(LastName; Rec.LastName)
                    {
                        ApplicationArea = all;
                        // Caption = 'Last Name';
                        // Editable = false; // Non éditable
                    }

                    field(Status; Rec.StatusTechnician)
                    {
                        ApplicationArea = all;
                        // Caption = 'Status';
                        // Editable = false; // Non éditable
                    }
                }

                group(detailsCustomer)
                {
                    Caption = 'Details Customer';

                    field(CustomerId; Rec.CustomerId)
                    {
                        ApplicationArea = All;
                        Caption = 'Customer ID';
                        TableRelation = Customer;  // Relation avec la table Customer
                    }

                    field(CustomerName; Rec.CustomerName)
                    {
                        ApplicationArea = All;
                        Caption = 'Customer Name';
                        Editable = false;
                    }
                }

                group(detailsItems)
                {
                    Caption = 'Details Item';

                    field(ItemId; Rec.ItemId)
                    {
                        ApplicationArea = All;
                        Caption = 'Item ID';
                        TableRelation = Item;  // Relation avec la table Item
                    }

                    field(ItemName; Rec.ItemName)
                    {
                        ApplicationArea = All;
                        Caption = 'Item Name';
                        Editable = false; // Rendre le champ non modifiable
                    }

                    field(UnitPrice; Rec.UnitPrice)
                    {
                        ApplicationArea = All;
                        Caption = 'Unit Price';
                        Editable = false;
                    }
                }

                group(Maintenance)
                {
                    Caption = 'Total Maintenance';

                    field(TotalMaintenance; Rec.TotalMaintenance)
                    {
                        ApplicationArea = All;
                        Caption = 'Maintenance Total';
                    }
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(SubmitMaintenanceRequest)
            {
                ApplicationArea = All;
                Caption = 'Submit Maintenance Request';

                trigger OnAction()
                begin
                    // Logique de soumission de la demande de maintenance
                    // Mettez à jour le statut si nécessaire ou créez l'entrée dans la table
                    Rec.StatusMaintenance := Rec.StatusMaintenance::Inprogress; // Définir le statut sur "Inprogress" au départ
                end;
            }
        }
    }
}
