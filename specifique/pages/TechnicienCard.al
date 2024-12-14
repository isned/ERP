page 60001 "Technicien Card"
{
    PageType = Card;
    //ApplicationArea = All;
    //UsageCategory = Documents;
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
                {
                    ApplicationArea = all;
                    Editable = false;
                }
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
                    StyleExpr = statusStyle;

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

    var

        statusStyle: Text;

    trigger OnAfterGetRecord()

    begin
        clear(statusStyle);
        if Rec.Status = Rec.Status::Available then
            statusStyle := 'favorable'
        else
            if Rec.Status = Rec.Status::Busy then
                statusStyle := 'unfavorable'
    end;



}