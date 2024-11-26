enum 60000 "Disponibility Status"
{
    Extensible = true;
    Caption = 'Disponibility Status';

    value(0; " ")
    {
        Caption = ' ';
    }
    value(1; Available)
    {
        Caption = 'Available ';
    }
    value(2; Busy)
    {
        Caption = 'Busy';
    }
}