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
                        Technicien: Record Technicien;
                    begin
                        // Vérifier si la DateEnd est inférieure à la DateStart
                        if Rec.DateEnd < Rec.DateStart then
                            ERROR('The End Date cannot be earlier than the Start Date.');

                        // Calculer la durée en jours
                        DurationInDays := Rec.DateEnd - Rec.DateStart;

                        // Remplir automatiquement le champ Duration
                        Rec.Duration := DurationInDays;

                        // Afficher une alerte si nécessaire
                        MESSAGE('The duration has been automatically calculated as %1 day(s).', DurationInDays);

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

                    field(Id; Rec.TechnicianId)
                    {
                        ApplicationArea = All;
                        Caption = 'Technician ID';

                        trigger OnLookup(var Text: Text): Boolean
                        var
                            Technicien: Record Technicien;
                        begin
                            Technicien.SetRange(Status, Technicien.Status::Available);

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
                        Editable = false;
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

                        trigger OnLookup(var Text: Text): Boolean
                        var
                            ItemRec: Record Item;
                        begin
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
                    // Logique de soumission de la demande de maintenance
                    // Mettez à jour le statut si nécessaire ou créez l'entrée dans la table
                    Rec.StatusMaintenance := Rec.StatusMaintenance::Inprogress; // Définir le statut sur "Inprogress" au départ
                end;
            }
        }
    }
}
