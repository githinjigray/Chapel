table 58014 "Scholarship Requisition Line"
{
    Caption = 'Scholarship Requisition Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
            Editable = false;
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(3; "Beneficiary No."; Code[20])
        {
            Caption = 'Beneficiary No.';
            TableRelation = "365  Beneficiary"."No.";
            trigger OnValidate()
            var
                BeneficiaryRec: Record "365  Beneficiary";
            begin
                "Beneficiray Name" := '';
                if BeneficiaryRec.Get(Rec."Beneficiary No.") then
                    Rec."Beneficiray Name" := BeneficiaryRec.Name
            end;
        }
        field(4; "Beneficiray Name"; Text[250])
        {
            Caption = 'Beneficiray Name';
            Editable = false;
        }
        field(5; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(20; Status; Option)
        {
            Caption = 'Status';
            Editable = false;
            DataClassification = ToBeClassified;
            OptionMembers = "",Open,"Pending Approval",Approved,Rejected,Posted,Reversed;
            OptionCaption = ' ,Open,Pending Approval,Approved,Rejected,Posted,Reversed';
        }
        field(21; "PV No."; Code[20])
        {
            Caption = 'PV No.';
        }
        field(22; "PV Line No."; Integer)
        {
            Caption = 'PV Line No.';
        }
    }
    keys
    {
        key(PK; "Line No.", "Document No.")
        {
            Clustered = true;
        }
    }
}
