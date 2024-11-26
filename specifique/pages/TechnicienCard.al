page 60001 "Technicien Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = Technicien;
    Caption = 'Technicien Card';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                Caption = 'General';
                field(Id; Rec.Id)
                { ApplicationArea = all; }
                field(FirstName; Rec.FirstName)
                { ApplicationArea = all; }
                field(LastName; Rec.LastName)
                { ApplicationArea = all; }





            }
            group(details)
            {
                Caption = 'Details';
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;

                }
            }


        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }





}