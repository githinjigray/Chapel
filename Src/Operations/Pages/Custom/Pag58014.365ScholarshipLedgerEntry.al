namespace Chapel.Chapel;

page 58014 "365 Scholarship Ledger Entry"
{
    ApplicationArea = All;
    Caption = 'Scholarship Ledger Entry';
    PageType = List;
    SourceTable = "365 Scholarship Ledger Entry";
    UsageCategory = History;
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                }
                field("Beneficiary No."; Rec."Beneficiary No.")
                {
                    ToolTip = 'Specifies the value of the Beneficiary No. field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
                field("PV No."; Rec."PV No.")
                {
                    ToolTip = 'Specifies the value of the PV No. field.', Comment = '%';
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                    ToolTip = 'Specifies the value of the Cheque No. field.', Comment = '%';
                }
                field("Cheque Receive Date"; Rec."Cheque Receive Date")
                {
                    ToolTip = 'Specifies the value of the Cheque Receive Date field.', Comment = '%';
                }
                field("Cheque Received By:"; Rec."Cheque Received By:")
                {
                    ToolTip = 'Specifies the value of the Cheque Received By: field.', Comment = '%';
                }
            }
        }
    }
}
