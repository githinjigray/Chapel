table 58000 "Common Codes-MPESA"
{
    Caption = 'Common Codes-MPESA';
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Code"; Code[100])
        {
            Caption = 'Code';
            DataClassification = toBeClassified;
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = toBeClassified;
        }
        field(3; "Account Type"; Enum "Account Type")
        {
            Caption = 'Account Type';
            DataClassification = toBeClassified;
        }
        field(4; "Account No."; Code[20])
        {
            Caption = 'Account No.';
            DataClassification = toBeClassified;
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account" where("Account Type" = const(Posting),
                                                                                          Blocked = const(false))
            else
            if ("Account Type" = const(Customer)) Customer
            else
            if ("Account Type" = const(Vendor)) Vendor
            else
            if ("Account Type" = const("Bank Account")) "Bank Account"
            else
            if ("Account Type" = const("Fixed Asset")) "Fixed Asset"
            else
            if ("Account Type" = const("IC Partner")) "IC Partner"
            else
            if ("Account Type" = const(Employee)) Employee;

            trigger OnValidate()
            var
                generalLedgerAccount: Record "G/L Account";
                customers: Record Customer;
                vendors: Record Vendor;
                bankAccount: Record "Bank Account";
                fixedAsset: Record "Fixed Asset";
                icPartner: Record "IC Partner";
                employee: Record Employee;
            begin
                Rec."Account Name" := '';

                if rec."Account Type" = rec."Account Type"::"G/L Account" then begin
                    generalLedgerAccount.SetRange("No.", "Account No.");
                    Rec."Account Name" := generalLedgerAccount.Name;
                end else if rec."Account Type" = "Account Type"::Customer then begin
                    customers.SetRange("No.", "Account No.");
                    Rec."Account Name" := customers.Name
                end else if rec."Account Type" = "Account Type"::Vendor then begin
                    vendors.SetRange("No.", "Account No.");
                    Rec."Account Name" := vendors.Name;
                end else if Rec."Account Type" = Rec."Account Type"::"Bank Account" then begin
                    bankAccount.SetRange("No.", "Account No.");
                    Rec."Account Name" := bankAccount.Name;
                end else if Rec."Account Type" = Rec."Account Type"::"Fixed Asset" then begin
                    fixedAsset.SetRange("No.", "Account No.");
                    Rec."Account Name" := fixedAsset.description;
                end else if Rec."Account Type" = Rec."Account Type"::"IC Partner" then begin
                    icPartner.SetRange("Code", "Account No.");
                    Rec."Account Name" := icPartner.Name;
                end else if Rec."Account Type" = Rec."Account Type"::Employee then begin
                    employee.SetRange("No.", "Account No.");
                    Rec."Account Name" := employee."First Name" + ' ' + employee."Last Name";
                end;
            end;

        }
        field(5; "Account Name"; Text[250])
        {
            Caption = 'Account Name';
            DataClassification = toBeClassified;
            editable = false;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
