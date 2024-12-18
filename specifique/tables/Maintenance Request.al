table 60002 MaintenanceRequest
{
    DataClassification = ToBeClassified;
    Caption = 'Maintenance Request';

    fields
    {

        /* field(107; "No. Series"; Code[20])
         {
             Caption = 'No. Series';
             Editable = false;
             TableRelation = "No. Series";
         }*/







        /*
                field(33; "Invoice Disc. Code"; Code[20])
                {
                    Caption = 'Invoice Disc. Code';
                    TableRelation = "MaintenanceRequest";

                    ValidateTableRelation = false;
                }*/








        /*   field(1; IdMaintenance; Code[20])
           {
               //Editable = false;
               Caption = 'Maintenance No.';
               DataClassification = ToBeClassified;
               trigger OnValidate()
               var
                   SalesSetup: Record "Sales & Receivables Setup";
                   NoSeriesMgt: Codeunit NoSeriesManagement;
               begin
                   if "IdMaintenance" <> xRec."IdMaintenance" then begin
                       SalesSetup.Get();
                       NoSeriesMgt.TestManual(SalesSetup."Maintenance Nos.");
                       "No. Series" := '';
                   end;
                   if "Invoice Disc. Code" = '' then
                       "Invoice Disc. Code" := "IdMaintenance";
               end;
           }*/
        field(1; IdMaintenance; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Maintenance ID';
            AutoIncrement = true;
        }


        field(2; DateStart; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Maintenance Date Start';
        }
        field(4; DescriptionMaintenance; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Maintenance Description';
        }
        field(11; StatusMaintenance; Enum "Maintenance Status")
        {
            DataClassification = ToBeClassified;
            Caption = 'Maintenance Status';
        }
        field(13; Duration; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Maintenance Duration';
        }
        field(12; DateEnd; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Maintenance Date End';
        }





        field(7; "CustomerId"; Code[20])
        {
            Caption = 'Customer ID';
            DataClassification = ToBeClassified;

            // Associe ce champ à la table Customer
            TableRelation = Customer."No.";

            trigger OnValidate()
            var
                CustomerRec: Record Customer;
            begin
                if CustomerRec.Get("CustomerId") then
                    "CustomerName" := CustomerRec.Name
                else
                    "CustomerName" := '';
            end;
        }

        field(8; "CustomerName"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = ToBeClassified;
            Editable = false; // Champ en lecture seule, mis à jour automatiquement
        }


        field(9; "ItemId"; Code[20])
        {
            Caption = 'Item ID';
            DataClassification = ToBeClassified;

            // Associe ce champ à la table Customer
            TableRelation = Item."No.";

            trigger OnValidate()
            var
                ItemRec: Record Item;
            begin
                if ItemRec.Get("ItemId") then
                    "ItemName" := ItemRec.Description
                else
                    "ItemName" := '';
            end;
        }

        field(10; "ItemName"; Text[100])
        {
            Caption = 'Item Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "UnitPrice"; Integer)
        {
            Caption = 'Item Price';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15; "TotalMaintenance"; Integer)
        {
            Caption = 'Total Maintenance';
            DataClassification = ToBeClassified;
            Editable = false;
        }



        field(60003; TechnicianId; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Technician ID';
            TableRelation = Technicien.Id; // Relation avec la table Technicien

        }

        field(60004; FirstName; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Technician First Name';
            TableRelation = Technicien.FirstName;
        }

        field(60005; LastName; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Technician Last Name';
            TableRelation = Technicien.LastName;
        }

        field(60006; StatusTechnician; Enum "Disponibility Status")
        {
            Caption = 'Technician Status';
            FieldClass = FlowField;
            CalcFormula = lookup(Technicien.Status where(
                Id = field(TechnicianId)
            ));
        }

    }

    keys
    {
        key(Key1; IdMaintenance)
        {
            Clustered = true;
        }



    }
    /* trigger OnInsert()
     var
         SalesSetup: Record "Sales & Receivables Setup"; // Get the sales setup
         NoSeriesMgt: Codeunit NoSeriesManagement; // Codeunit for handling number series
     begin
         if "IdMaintenance" = '' then begin // Corrected syntax for the field
             SalesSetup.Get(); // Get the sales setup record
             SalesSetup.TestField("Maintenance Nos."); // Ensure the Customer Nos. field is properly set up
                                                       // Initialize the series for "No." based on the "Customer Nos." field from SalesSetup
             NoSeriesMgt.InitSeries(SalesSetup."Maintenance Nos.", xRec."No. Series", 0D, "IdMaintenance", "No. Series");
         end;
     end;*/







    trigger OnModify()
    begin
        // Custom logic when modifying a maintenance request
    end;

    trigger OnDelete()
    begin
        // Custom logic when deleting a maintenance request
    end;

    trigger OnRename()
    begin
        // Custom logic when renaming a maintenance request
    end;


    procedure GetMaintenanceByCustomer(CustomerNo: Code[20]): Boolean
    begin
        Reset();
        SetRange("CustomerId", CustomerNo); // Filtrer par CustomerId
        if FindFirst then
            exit(true); // Retourne vrai si une maintenance est trouvée
        exit(false);
    end;


}