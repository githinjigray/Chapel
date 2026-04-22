namespace Chapel.Chapel;

page 58018 "Beneficiary Activity-Cheque"
{
    ApplicationArea = All;
    Caption = 'Beneficiary Activity Lines- Cheque Receiving';
    PageType = ListPart;
    SourceTable = "Beneficiary Activity Lines";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Beneficiry No."; Rec."Beneficiry No.")
                {
                    ToolTip = 'Specifies the value of the Beneficiry No. field.', Comment = '%';
                }
                field("Beneficiary Name"; Rec."Beneficiary Name")
                {
                    ToolTip = 'Specifies the value of the Beneficiary Name field.', Comment = '%';
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                    ToolTip = 'Specifies the value of the Cheque No. field.', Comment = '%';
                }
                field("Received By"; Rec."Received By")
                {
                    ToolTip = 'Specifies the value of the Received By field.', Comment = '%';
                }
                field("Receiving Date"; Rec."Receiving Date")
                {
                    ToolTip = 'Specifies the value of the Receiving Date field.', Comment = '%';
                }
            }
        }
    }
}
