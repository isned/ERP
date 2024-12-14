page 60000 "Technicien list"
{    
    CardPageId = "Technicien Card";
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Technicien;
    Caption = 'Technicien Liste';
    


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Id; Rec.Id)
                { 
                    ApplicationArea = all;
                    Editable = false; }
                field(FirstName; Rec.FirstName)
                {
                     ApplicationArea = all; }
                field(LastName; Rec.LastName)
                {
                     ApplicationArea = all; }
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
            action(DeleteTechnician)
            {
                ApplicationArea = All;
                Caption = 'Delete Technician';
                trigger OnAction()
                begin
                    if Rec.Status = Rec.Status::Available then
                        Error('Cannot delete a technician with status "Available".')
                    else
                        Rec.Delete();
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
        else if Rec.Status = Rec.Status::Busy then
            statusStyle := 'unfavorable';
    end;
}

   
  
