table 58010 "365 Beneficiary Activities."
{
    Caption = 'Beneficiary Activities';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[50])
        {
            Caption = 'No.';
            Editable = false;
        }
        field(2; "Document Date"; Date)
        {
            Caption = 'Document Date';
            Editable = false;
        }
        field(3; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(4; "Activity Type"; Option)
        {
            Caption = 'Activity Type';
            OptionMembers = ,"Cheque Receiving","Commitment Fee Payment";
            OptionCaption = ' ,Cheque Receiving,Commitment Fee Payment';
        }
        field(5; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(10; "No. Series"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        if "No." = '' then begin
            FundsGeneralSetup.get;
            FundsGeneralSetup.TESTFIELD(FundsGeneralSetup."Activity No.");
            "No. Series" := FundsGeneralSetup."Activity No.";
            if NoSeriesMgt.AreRelated(FundsGeneralSetup."Activity No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeriesMgt.GetNextNo("No. Series");
        end;
        Rec."Posting Date" := Today;
        Rec."Document Date" := Today;
    end;

    var
        FundsGeneralSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit "No. Series";
}
