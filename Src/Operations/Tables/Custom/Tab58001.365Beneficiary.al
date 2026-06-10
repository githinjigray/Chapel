table 58001 "365  Beneficiary"
{
    Caption = '365  Beneficiaries';
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
        field(3; Gender; Option)
        {
            Caption = 'Gender';
            OptionMembers = ,Male,Female;
            OptionCaption = ' ,Male,Female';
        }
        field(4; "Date of Birth"; Date)
        {
            Caption = 'Date of Birth';
        }
        field(5; "Current Class/Grade"; Text[100])
        {
            Caption = 'Current Class/Grade';
        }
        field(6; "Phone No."; Code[30])
        {
            Caption = 'Phone No.';
            OptimizeForTextSearch = true;
            ExtendedDatatype = PhoneNo;
        }
        field(7; Email; Text[250])
        {
            Caption = 'Email';
            OptimizeForTextSearch = true;
            ExtendedDatatype = EMail;
        }
        field(8; "No. Series"; Text[250])
        {
            Caption = 'No. Series';
        }
        field(9; "Amount Received"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("365 Scholarship Ledger Entry".Amount where("Beneficiary No." = field("No.")));
            Caption = 'Amount Received';

        }
        field(10; "School Name"; Text[250])
        {
            Caption = 'School Name';
            Editable = false;
        }
        field(12; "Mentor Name"; Text[250])
        {
            Caption = 'Mentor Name';
        }
        field(13; "School No."; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Beneficiary School"."No.";
            trigger OnValidate()
            var
                BeneficiarySchool: Record "Beneficiary School";
            begin
                "School Name" := '';
                if BeneficiarySchool.get("School No.") then
                    "School Name" := BeneficiarySchool."School Name";
            end;
        }
        field(14; "Sponsor No."; code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "365 Sponsor"."No.";
            trigger OnValidate()
            var
                Sponsor: Record "365 Sponsor";
            begin
                "Sponsor Name" := '';
                if Sponsor.get("Sponsor No.") then
                    "Sponsor Name" := Sponsor."Name";
            end;
        }
        field(15; "Sponsor Name"; Text[250])
        {
            Caption = 'Sponsor Name';
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
    trigger OnInsert()
    begin
        if "No." = '' then begin
            FundsGeneralSetup.get;
            FundsGeneralSetup.TESTFIELD(FundsGeneralSetup."Benficiary No.");
            "No. Series" := FundsGeneralSetup."Benficiary No.";
            if NoSeriesMgt.AreRelated(FundsGeneralSetup."Benficiary No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeriesMgt.GetNextNo("No. Series");
        end;
    end;

    var
        FundsGeneralSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit "No. Series";
}
