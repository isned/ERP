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
                field(DateStart; Rec.DateStart)
                {
                    ApplicationArea = All;
                    Caption = 'Maintenance Date Start';
                }
                field(DateEnd; Rec.DateEnd)
                {
                    ApplicationArea = All;
                    Caption = 'Maintenance Date End ';
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

                field(Status; Rec.StatusTechnician)
                {
                    ApplicationArea = All;
                    Caption = 'Status';
                }
                field(No; Rec.CustomerId)
                {
                    ApplicationArea = All;
                    Caption = 'Numero Customer';
                }
                field(CustomerName; Rec.CustomerName)
                {
                    ApplicationArea = All;
                    Caption = 'Name Customer';
                }
                field(ItemNo; Rec.ItemId)
                {
                    ApplicationArea = All;
                    Caption = 'Numero Item';
                }
                field(ItemPrice; Rec.UnitPrice)
                {
                    ApplicationArea = All;
                    Caption = 'Price Item';
                }
                field(ItemName; Rec.CustomerName)
                {
                    ApplicationArea = All;
                    Caption = 'Name Item';
                }
                field(TotalMaintenance; Rec.TotalMaintenance)
                {
                    ApplicationArea = All;
                    Caption = 'TotalMaintenance';
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

