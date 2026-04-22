table 58008 "Endowment General Setup"
{
    Caption = 'Endowment General Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Integer)
        {
            Caption = 'Primary Key';
        }
        field(2; "Endowment Beneficiary Account"; Code[20])
        {
            Caption = 'Endowment Beneficiary Account';
            TableRelation = "G/L Account"."No.";
            trigger OnValidate()
            var
                GlAccount: Record "G/L Account";
            begin
                "Account Name" := '';

                GlAccount.Reset();
                GlAccount.SetRange("No.", "Endowment Beneficiary Account");
                if GlAccount.FindFirst() then begin
                    "Account Name" := GlAccount.Name;
                end;

            end;
        }
        field(3; "Account Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
