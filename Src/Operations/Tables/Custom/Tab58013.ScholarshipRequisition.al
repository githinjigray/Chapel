table 58013 "Scholarship Requisition"
{
    Caption = 'Scholarship Requisition';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            Editable = false;
        }
        field(2; "Requisition Date"; Date)
        {
            Caption = 'Requisition Date';
        }
        field(3; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(4; "Term/Semester"; Code[20])
        {
            Caption = 'Term/Semester';
        }
        field(5; "School No."; Code[20])
        {
            Caption = 'School No.';
            TableRelation = "Beneficiary School"."No.";
            trigger OnValidate()
            var
                SchoolRec: Record "Beneficiary School";
                RequisitionlineRec: Record "Scholarship Requisition Line";
                ExistRequisitionlineRec: Record "Scholarship Requisition Line";
                BeneficiaryRec: Record "365  Beneficiary";
            begin
                "School Name" := '';
                if schoolRec.Get("School No.") then begin
                    "School Name" := SchoolRec."School Name";
                end;
                ExistRequisitionlineRec.Reset();
                ExistRequisitionlineRec.SetRange("Document No.", "No.");
                if ExistRequisitionlineRec.FindSet() then begin
                    if confirm('Changing the school will remove all the existing lines, do you want to continue?') then
                        ExistRequisitionlineRec.DeleteAll();
                end;


                BeneficiaryRec.Reset();
                BeneficiaryRec.SetRange("School No.", "School No.");
                if BeneficiaryRec.FindSet() then begin
                    repeat
                        RequisitionlineRec.Init();
                        RequisitionlineRec."Line No." := 0;
                        RequisitionlineRec."Document No." := "No.";
                        RequisitionlineRec."Beneficiary No." := BeneficiaryRec."No.";
                        RequisitionlineRec.Validate("Beneficiary No.");
                        RequisitionlineRec.Insert();
                    until BeneficiaryRec.Next() = 0;
                end;
            end;
        }
        field(6; "School Name"; Text[250])
        {
            Caption = 'School Name';
            Editable = false;
        }
        field(7; "PV No."; Code[20])
        {
            Caption = 'PV No.';
            Editable = false;
        }
        field(8; "PV Date"; Date)
        {
            Caption = 'PV Date';
            Editable = false;
        }
        field(9; "Cheque No."; Code[20])
        {
            Caption = 'Cheque No.';
            Editable = false;
        }
        field(10; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
        }
        field(11; "Total Amount"; Decimal)
        {
            fieldClass = FlowField;
            CalcFormula = Sum("Scholarship Requisition Line"."Amount" where("Document No." = field("No.")));
            Caption = 'Total Amount';
            editable = false;
        }
        field(40; Status; Option)
        {
            Caption = 'Status';
            Editable = false;
            DataClassification = ToBeClassified;
            OptionMembers = "",Open,"Pending Approval",Approved,Rejected,Posted,Reversed;
            OptionCaption = ' ,Open,Pending Approval,Approved,Rejected,Posted,Reversed';
        }
        field(41; "Payment Status"; Option)
        {
            Caption = 'Payment Status';
            Editable = false;
            DataClassification = ToBeClassified;
            OptionMembers = "",Paid,"Partially-Paid",Unpaid;
            OptionCaption = ' ,Paid,Partially-Paid,Unpaid';
        }
        field(43; "Incoming Document Entry No."; Integer)
        {
            Caption = 'Incoming Document Entry No.';
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
        fieldgroup(DropDown; "No.", "School Name", Description, "Requisition Date")
        {
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
            Status := Status::Open;
            "Payment Status" := "Payment Status"::Unpaid;
        end;
    end;

    var
        FundsGeneralSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit "No. Series";

    /// <summary>
    /// GetStatusStyleText.
    /// </summary>
    /// <returns>Return variable StatusStyleText of type Text.</returns>
    procedure GetStatusStyleText() StatusStyleText: Text
    begin
        if Status = Status::Open then
            StatusStyleText := 'Favorable'
        else
            StatusStyleText := 'Strong';

    end;
}
