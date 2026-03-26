table 58004 "365 Scholarship"
{
    Caption = '365 Scholarship';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            editable = false;
        }
        field(2; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(3; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(4; "Scholarship Value"; Decimal)
        {
            Caption = 'Scholarship Value';
        }
        field(5; Institution; Text[250])
        {
            Caption = 'Institution';
        }
        field(6; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = ,Active,Inactive;
            OptionCaption = ' ,Active,Inactive';
        }
        field(8; "No. Series"; Text[250])
        {
            Caption = 'No. Series';
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
            FundsGeneralSetup.TESTFIELD(FundsGeneralSetup."Scholarship No.");
            "No. Series" := FundsGeneralSetup."Scholarship No.";
            if NoSeriesMgt.AreRelated(FundsGeneralSetup."Scholarship No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeriesMgt.GetNextNo("No. Series");
        end;
    end;

    var
        FundsGeneralSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit "No. Series";
}
