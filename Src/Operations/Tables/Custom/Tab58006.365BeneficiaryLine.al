table 58006 "365 Beneficiary Line"
{
    Caption = '365 Beneficiary Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
        }
        field(2; "Guardian No."; Code[20])
        {
            Caption = 'Guardian No.';
            tableRelation = "365 Guardian";
            trigger OnValidate()
            var
                Guardian: Record "365 Guardian";
            begin
                clear("Guardian Name");
                if Guardian.Get("Guardian No.") then
                    "Guardian Name" := Guardian.Name;
            end;
        }
        field(3; "Guardian Name"; Text[250])
        {
            Caption = 'Guardian Name';
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
