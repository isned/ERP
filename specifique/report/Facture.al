report 60030 "Facture"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = '.\specifique\report\Facture.RDL';
    Caption = 'ReportProject';

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(No_; "No.")
            {
                IncludeCaption = true;
            }

            column(Name; Name)
            {
                IncludeCaption = true;
            }

            // Get Maintenance Requests for the Customer
            dataitem(MaintenanceRequest; "MaintenanceRequest")
            {


                column(IdMaintenance; "IdMaintenance")
                {
                    IncludeCaption = true;
                }

                column(DateStart; DateStart)
                {
                    IncludeCaption = true;
                }

                column(DescriptionMaintenance; DescriptionMaintenance)
                {
                    IncludeCaption = true;
                }

                column(StatusMaintenance; StatusMaintenance)
                {
                    IncludeCaption = true;
                }

                column(Duration; Duration)
                {
                    IncludeCaption = true;
                }

                column(DateEnd; DateEnd)
                {
                    IncludeCaption = true;
                }

                column(ItemName; "ItemName")
                {
                    IncludeCaption = true;
                }

                column(UnitPrice; "UnitPrice")
                {
                    IncludeCaption = true;
                }

                column(TotalMaintenance; "TotalMaintenance")
                {
                    IncludeCaption = true;
                }
            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(CustomerName; Customer.Name)
                    {
                        Caption = 'Customer Name';
                    }

                    // Add more fields as required
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {
                    // Additional actions if needed
                }
            }
        }
    }

    trigger OnPreReport()
    begin
        if companyInformation_G.get() then begin
            CompanyName := CompanyInformation_G.Name;
            CompanyPhone := CompanyInformation_G."Phone No.";
            companyInformation_G.CalcFields(Picture);
        end;
    end;

    var
        companyInformation_G: Record "Company Information";
        companyName: Text;
        companyPhone: Text;
}
