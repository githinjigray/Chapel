table 58011 "Beneficiary Activity Lines"
{
    Caption = 'Beneficiary Activity Lines';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No"; Integer)
        {
            Caption = 'Line No';
            AutoIncrement = true;
        }
        field(2; "Activity No."; Code[50])
        {
            Caption = 'Activity No.';
        }
        field(3; "Beneficiry No."; Code[50])
        {
            Caption = 'Beneficiry No.';
            TableRelation = "365  Beneficiary";
            trigger OnValidate()
            var
                Beneficiary: Record "365  Beneficiary";
            begin
                if Beneficiary.get("Beneficiry No.") then begin
                    "Beneficiary Name" := Beneficiary.Name;
                end;

            end;
        }
        field(4; "Beneficiary Name"; Text[250])
        {
            Caption = 'Beneficiary Name';
            Editable = false;
        }
        field(5; "Cheque No."; Code[50])
        {
            Caption = 'Cheque No.';
            TableRelation = "365 Scholarship Ledger Entry"."Cheque No." where("Cheque Received By:" = filter(''), "Beneficiary No." = field("Beneficiry No."));
        }
        field(6; "Received By"; Text[250])
        {
            Caption = 'Received By';
        }
        field(7; "Receiving Date"; Date)
        {
            Caption = 'Receiving Date';
        }
        field(8; Amount; Decimal)
        {
            Caption = 'Amount';
        }
    }
    keys
    {
        key(PK; "Line No", "Activity No.")
        {
            Clustered = true;
        }
    }
}
