namespace Chapel.Chapel;

page 58016 "Beneficiary Activity List"
{
    ApplicationArea = All;
    Caption = 'Beneficiary Activity List';
    PageType = List;
    SourceTable = "365 Beneficiary Activities.";
    UsageCategory = Lists;
    CardPageId = "Beneficiary Activity Card";
    layout
    {
        area(Content)
        {
            repeater(General)
            {
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
        }
    }
}
