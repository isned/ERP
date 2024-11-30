page 60004 "Maintenance Request Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Maintenance Request";
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
                    begin
                        // Vérifier si la DateEnd est inférieure à la DateStart
                        if Rec.DateEnd < Rec.DateStart then
                            ERROR('The End Date cannot be earlier than the Start Date.'); // Alerte

                        // Calculer la durée en jours
                        DurationInDays := Rec.DateEnd - Rec.DateStart;

                        // Remplir automatiquement le champ Duration
                        Rec.Duration := DurationInDays; // Le champ est directement rempli avec le nombre de jours

                        // Afficher une alerte si nécessaire
                        // Utilisation de ERROR pour afficher une alerte
                        MESSAGE('The duration has been automatically calculated as %1 day(s).', DurationInDays);
                    end;
                }

                field(Duration; Rec.Duration)
                {
                    ApplicationArea = All;
                    Caption = 'Duration';
                }

                field(Description; Rec.Description)
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
                    Caption = 'Details Technician ';

                    field(Id; Rec.TechnicianId)
                    {
                        ApplicationArea = All;
                        Caption = 'Technician ID';

                        trigger OnLookup(var Text: Text): Boolean
                        var
                            Technicien: Record Technicien;
                        begin
                            // Filtrer uniquement les techniciens avec le statut "Available"
                            Technicien.SetRange(Status, Technicien.Status::Available); // Utilisation de l'énumération

                            // Afficher la liste filtrée des techniciens
                            if PAGE.RunModal(PAGE::"Technicien list", Technicien) = ACTION::LookupOK then begin
                                Rec.TechnicianId := Technicien.Id;
                                Rec.FirstName := Technicien.FirstName;
                                Rec.LastName := Technicien.LastName;
                                Rec.StatusTechnician := Technicien.Status;
                            end;
                            exit(true);
                        end;

                        trigger OnValidate()
                        var
                            Technicien: Record Technicien;
                        begin
                            if Technicien.Get(Rec.TechnicianId) then begin
                                // Vérifier si le technicien est disponible
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
                        ApplicationArea = All;
                        Editable = false; // Les champs sont récupérés automatiquement
                    }

                    field(LastName; Rec.LastName)
                    {
                        ApplicationArea = All;
                        Editable = false;
                    }

                    field(Status; Rec.StatusTechnician)
                    {
                        ApplicationArea = All;
                        Editable = false;
                    }
                }

                group(detailsCustomer)
                {
                    Caption = 'Details Customer';

                    field(CustomerId; Rec.CustomerId)
                    {
                        ApplicationArea = All;
                        Caption = 'Customer ID';

                        trigger OnLookup(var Text: Text): Boolean
                        var
                            CustomerRec: Record Customer;
                        begin
                            // Affiche la liste des clients pour sélection
                            if PAGE.RunModal(PAGE::"Customer List", CustomerRec) = ACTION::LookupOK then begin
                                Rec.CustomerId := CustomerRec."No.";
                                Rec.CustomerName := CustomerRec.Name;
                            end;
                            exit(true);
                        end;

                        trigger OnValidate()
                        var
                            CustomerRec: Record Customer;
                        begin
                            if CustomerRec.Get(Rec.CustomerId) then begin
                                Rec.CustomerName := CustomerRec.Name;
                            end else begin
                                ERROR('Customer with ID %1 does not exist.', Rec.CustomerId);
                            end;
                        end;
                    }

                    field(CustomerName; Rec.CustomerName)
                    {
                        ApplicationArea = All;
                        Caption = 'Customer Name';
                        Editable = false; // Champ non modifiable, mis à jour automatiquement
                    }
                }

                group(detailsItems)
                {
                    Caption = 'Details Item';

                    field(ItemId; Rec.ItemId)
                    {
                        ApplicationArea = All;
                        Caption = 'Item ID';

                        trigger OnLookup(var Text: Text): Boolean
                        var
                            ItemRec: Record Item;
                        begin
                            // Affiche la liste des clients pour sélection
                            if PAGE.RunModal(PAGE::"Item List", ItemRec) = ACTION::LookupOK then begin
                                Rec.ItemId := ItemRec."No.";
                                Rec.ItemName := ItemRec.Description;
                            end;
                            exit(true);
                        end;

                        trigger OnValidate()
                        var
                            CustomerRec: Record Customer;
                        begin
                            if CustomerRec.Get(Rec.CustomerId) then begin
                                Rec.CustomerName := CustomerRec.Name;
                            end else begin
                                ERROR('Customer with ID %1 does not exist.', Rec.CustomerId);
                            end;
                        end;
                    }

                    field(ItemName; Rec.ItemName)
                    {
                        ApplicationArea = All;
                        Caption = 'Item Name';
                        Editable = false;
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
                    // Logic to submit the maintenance request
                    // Implement the submission logic, e.g., status update or create entry
                end;
            }
        }
    }
}
