enum 60001 "Maintenance Status"
{
    Extensible = true;
    Caption = 'Maintenance Status';

    value(0; " ")
    {
        Caption = ' ';
    }
    value(1; progress)
    {
        Caption = ' progress  ';
    }
    value(2; pending)
    {
        Caption = 'pending ';
    }
    value(3; completed)
    {
        Caption = 'completed ';
    }
}