page 60005 "RoleCenter"
{
    PageType = RoleCenter;
    Caption = 'Rôle de Center';

    layout
    {
        area(RoleCenter)
        {


            part(cardCueProject; 60006)
            {
                ApplicationArea = All;
                Caption = 'Card Cue';
            }


        }
    }


    var
        myInt: Integer;
}