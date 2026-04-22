namespace Chapel.Chapel;

page 58017 "Beneficiary Activity Card"
{
    ApplicationArea = All;
    Caption = 'Beneficiary Activity Card';
    PageType = Card;
    SourceTable = "365 Beneficiary Activities.";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.', Comment = '%';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                }
                field("Activity Type"; Rec."Activity Type")
                {
                    ToolTip = 'Specifies the value of the Activity Type field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
            }
            part(Control1; "Beneficiary Activity-Cheque")
            {
                ApplicationArea = All;
                SubPageLink = "Activity No." = field("No.");
            }
            part(Control2; "Beneficiary Activity-Fees")
            {
                ApplicationArea = All;
                SubPageLink = "Activity No." = field("No.");
            }
        }
    }
}
