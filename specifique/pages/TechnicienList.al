page 60000 "Technicien list"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Technicien;
    Caption = 'Technicien Liste';
    CardPageId = "Technicien Card";


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Id; Rec.Id)
                { ApplicationArea = all; }
                field(FirstName; Rec.FirstName)
                { ApplicationArea = all; }
                field(LastName; Rec.LastName)
                { ApplicationArea = all; }
                field(Status; Rec.Status)
                {
                    ApplicationArea = all;
                    StyleExpr = statusStyle;
                   
                }
              


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

   
  
