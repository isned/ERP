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

                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                    Caption = 'Maintenance Date';
                }



                group(detailsTechnician)
                {
                    Caption = 'Details Technician ';
                    field(Id; Rec.TechnicianId)
                    {
                        ApplicationArea = all;
                        trigger OnValidate()
                        var

                            Technicien: Record Technicien;
                        begin
                            if Technicien.Get(Rec.TechnicianId) then
                                Rec.FirstName := Technicien.FirstName;
                            // Rec.Status := Technicien.Status;
                        end;
                    }
                    field(FirstName; Rec.FirstName)
                    {
                        ApplicationArea = all;

                    }
                    field(LastName; Rec.LastName)
                    {
                        ApplicationArea = all;

                    }
                    field(Status; Rec.status)
                    {
                        ApplicationArea = all;
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