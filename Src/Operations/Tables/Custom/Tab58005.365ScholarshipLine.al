table 58005 "365 Scholarship Line"
{
    Caption = '365 Scholarship Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
        }
        field(2; "Scholarship No."; Code[20])
        {
            Caption = 'Scholarship No.';
        }
        field(3; "Beneficiary No."; Code[20])
        {
            Caption = 'Beneficiary No.';
            tableRelation = "365  Beneficiary"."No.";
            trigger OnValidate()
            var
                Beneficiary: Record "365  Beneficiary";
            begin
                clear(beneficiaryName);
                if Beneficiary.Get("Beneficiary No.") then
                    beneficiaryName := Beneficiary.Name;
            end;
        }
        field(4; beneficiaryName; Text[250])
        {
            Caption = 'Beneficiary Name';
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Line No.")
        {
            Clustered = true;
        }
    }
}
