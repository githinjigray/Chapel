table 58007 "365 Scholarship Ledger Entry"
{
    Caption = '365 Scholarship Ledger Entry';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No"; Integer)
        {
            Caption = 'Line No';
            AutoIncrement = true;
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
        field(6; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Cheque Received By:"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Cheque Receive Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Cheque No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Beneficiary Name."; text[250])
        {
            Caption = 'Beneficiary Name';
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Line No", "Cheque No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Cheque No.", "Beneficiary No.", "Beneficiary Name.", "PV No.")
        {

        }
    }
}
