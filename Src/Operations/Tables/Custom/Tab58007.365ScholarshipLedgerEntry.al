table 58007 "365 Scholarship Ledger Entry"
{
    Caption = '365 Scholarship Ledger Entry';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No"; Integer)
        {
            Caption = 'Line No';
        }
        field(2; "Scholarship No."; Code[20])
        {
            Caption = 'Scholarship No.';
            tableRelation = "365 Scholarship"."No.";
        }
        field(3; "Beneficiary No."; Code[20])
        {
            Caption = 'Beneficiary No.';
            tableRelation = "365  Beneficiary"."No.";
        }
        field(4; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(5; "PV No."; Code[20])
        {
            Caption = 'PV No.';
        }
    }
    keys
    {
        key(PK; "Line No")
        {
            Clustered = true;
        }
    }
}
