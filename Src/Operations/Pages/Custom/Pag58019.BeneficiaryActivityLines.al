namespace Chapel.Chapel;

page 58019 "Beneficiary Activity-Fees"
{
    ApplicationArea = All;
    Caption = 'Beneficiary Activity Lines- Fees';
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
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
            }
        }
    }
}
