tableextension 50007 DimensionValueExt extends "Dimension Value"
{
    fields
    {
        field(70000; "Sequence No"; Integer)
        {
            Caption = 'Sequence No';
            DataClassification = ToBeClassified;
        }
        field(70001; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            DataClassification = ToBeClassified;
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value"."code" where("Global Dimension No." = const(1), "Dimension Value Type" = const(Standard));

        }
        field(70002; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }

        field(70003; "E-Mail"; Text[250])
        {
            Caption = 'E-Mail';
            DataClassification = ToBeClassified;
        }
        field(70004; "LPO Corr. E-Mail"; Text[250])
        {
            Caption = 'LPO Correspondence E-Mail';
            DataClassification = ToBeClassified;
        }
        field(70005; "Invoice Corr. E-Mail"; Text[250])
        {
            Caption = 'Invoice Correspondence E-Mail';
            DataClassification = ToBeClassified;
        }
        field(70006; Region; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Region';
        }
        field(70007; "Dimension Value 1"; Code[50])
        {
            Caption = 'Dimension Value 1';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value"."code" where("Global Dimension No." = const(1), "Dimension Value Type" = const(Standard));
        }
        field(70008; "Dimension Value 2"; Code[50])
        {
            Caption = 'Dimension Value 2';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value"."code" where("Global Dimension No." = const(2), "Dimension Value Type" = const(Standard));
        }
        field(70009; "Dimension Value 3"; Code[50])
        {
            Caption = 'Dimension Value 3';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value"."code" where("Global Dimension No." = const(3), "Dimension Value Type" = const(Standard));
        }
    }
}
