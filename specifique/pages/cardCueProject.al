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

                field("NumberTechnician Available"; Rec.NumberTechnicianAvailable)
                {
                    ApplicationArea = All;
                    Caption = 'Total Technician Available';
                    Editable = false;

                }
                field("NumberTechnician Busy"; Rec.NumberTechnicianBusy)
                {
                    ApplicationArea = All;
                    Caption = 'Total Technician Busy';
                    Editable = false;

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


    trigger OnOpenPage()
    var
        usersetup: Record "User Setup";
    begin
        // Réinitialise les valeurs du record actuel
        Rec.Reset;

        // Si l'enregistrement n'existe pas encore, l'initialiser et l'insérer
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert;
        end;

        // Vérifie si les données de l'utilisateur actuel existent dans la table "User Setup"
        if usersetup.Get(UserId) then begin
            // Applique un filtre sur le record actuel en fonction du code département de l'utilisateur
            // Rec.SetFilter(DepartmentFilter, usersetup.DepartmentCode);
        end;
    end;

}
