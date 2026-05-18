table 58012 "Beneficiary School"
{
    Caption = 'Beneficiary School';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            Editable = false;
        }
        field(2; "School Name"; Text[250])
        {
            Caption = 'School Name';
        }
        field(3; Address; Text[250])
        {
            Caption = 'Address';
        }
        field(4; "Address 2"; Text[250])
        {
            Caption = 'Address 2';
        }
        field(10; "No. Series"; Code[20])
        {
            Caption = 'No.';
            Editable = false;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "No.", "School Name")
        {
        }
    }
    trigger OnInsert()
    begin
        if "No." = '' then begin
            FundsGeneralSetup.get;
            FundsGeneralSetup.TESTFIELD(FundsGeneralSetup."School No.");
            "No. Series" := FundsGeneralSetup."School No.";
            if NoSeriesMgt.AreRelated(FundsGeneralSetup."School No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeriesMgt.GetNextNo("No. Series");

        end;
    end;

    var
        FundsGeneralSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit "No. Series";
}
