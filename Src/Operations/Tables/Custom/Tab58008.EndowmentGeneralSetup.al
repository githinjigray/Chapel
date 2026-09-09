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
        field(5; "Scholarship Account No."; Code[20])
        {
            Caption = 'Scholarship Account No.';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";
        }
        field(6; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            DataClassification = ToBeClassified;
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value"."code" where("Global Dimension No." = const(1), "Dimension Value Type" = const(Standard), Blocked = const(false));
        }
        field(7; "Global Dimension 2 Code"; Code[20])
        {
            Caption = 'Global Dimension 2 Code';
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value"."code" where("Global Dimension No." = const(2), "Dimension Value Type" = const(Standard), Blocked = const(false));
        }
        field(8; "Shortcut Dimension 3 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 3 Code';
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value"."code" where("Global Dimension No." = const(3), "Dimension Value Type" = const(Standard), Blocked = const(false));
        }
        field(9; "Shortcut Dimension 4 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 4 Code';
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,4';
            TableRelation = "Dimension Value"."code" where("Global Dimension No." = const(4), "Dimension Value Type" = const(Standard), Blocked = const(false), "Dimension Value 3" = field("Shortcut Dimension 3 Code"));
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
