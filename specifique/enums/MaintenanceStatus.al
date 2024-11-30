enum 60001 "Maintenance Status"
{
    Extensible = true;
    Caption = 'Maintenance Status';


    value(0; Inprogress)
    {
        Caption = ' Inprogress  ';
    }
    value(1; completed)
    {
        Caption = 'completed ';
    }
}