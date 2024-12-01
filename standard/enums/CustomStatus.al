enum 60020 "Custom Status"
{
    Extensible = true;
    Caption = 'Custom Status';

    value(0; " ")
    {
        Caption = ' ';
    }
    value(1; Signed)
    {
        Caption = 'Signed ';
    }
    value(2; Canceled)
    {
        Caption = 'Canceled';
    }
}