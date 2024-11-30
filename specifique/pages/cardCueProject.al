page 60006 cardCue
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = cueProject;

    layout
    {
        area(Content)
        {
            cuegroup(GroupName)
            {


                field("NumberTechnician"; Rec.NumberTechnician)
                {
                    ApplicationArea = All;
                    Caption = 'Total Technician';
                    Editable = false;
                    DrillDownPageId = "Technicien list";
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
                Caption = 'Action Name';

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;




}
