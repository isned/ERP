page 60003 "Maintenance Request List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Maintenance Request";
    Caption = 'Maintenance Requests List';
    CardPageId = "Maintenance Request Card";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
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
                field(TechnicianId; Rec.TechnicianId)
                {
                    ApplicationArea = All;
                    Caption = 'Technician ID';
                }
                field(FirstName; Rec.FirstName)
                {
                    ApplicationArea = All;
                    Caption = 'Technician FirstName';
                }
                field(LastName; Rec.LastName)
                {
                    ApplicationArea = All;
                    Caption = 'Technician LastName';
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Caption = 'Status';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(NewRequest)
            {
                ApplicationArea = All;
                Caption = 'New Maintenance Request';

                trigger OnAction()
                begin
                    // Logic to create a new maintenance request
                    // Implement action logic here, e.g., open card page or create new record
                end;
            }
        }
    }
}

