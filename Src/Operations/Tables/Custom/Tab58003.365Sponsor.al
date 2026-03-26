table 58003 "365 Sponsor"
{
    Caption = '365 Sponsor';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            editable = false;
        }
        field(2; Name; Text[250])
        {
            Caption = 'Name';
        }
        field(3; "Phone No."; Text[100])
        {
            Caption = 'Phone No.';
            OptimizeForTextSearch = true;
            ExtendedDatatype = PhoneNo;
        }
        field(4; Email; Text[250])
        {
            Caption = 'Email';
        }
        field(5; Gender; Option)
        {
            Caption = 'Gender';
            OptionMembers = ,Male,Female;
            OptionCaption = ' ,Male,Female';
        }
        field(6; Occupation; Text[250])
        {
            OptimizeForTextSearch = true;
            ExtendedDatatype = EMail;
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
            FundsGeneralSetup.TESTFIELD(FundsGeneralSetup."Guardian No.");
            "No. Series" := FundsGeneralSetup."Guardian No.";
            if NoSeriesMgt.AreRelated(FundsGeneralSetup."Guardian No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeriesMgt.GetNextNo("No. Series");
        end;
    end;

    var
        FundsGeneralSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit "No. Series";
}
