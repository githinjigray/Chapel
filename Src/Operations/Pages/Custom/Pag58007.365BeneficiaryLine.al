namespace Chapel.Chapel;

page 58007 "365 Beneficiary Line"
{
    ApplicationArea = All;
    Caption = '365 Beneficiary Line';
    PageType = ListPart;
    SourceTable = "365 Beneficiary Line";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Guardian No."; Rec."Guardian No.")
                {
                    ToolTip = 'Specifies the value of the Guardian No. field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Guardian Name"; Rec."Guardian Name")
                {
                    ToolTip = 'Specifies the value of the Guardian Name field.', Comment = '%';
                    ApplicationArea = All;
                }
            }
        }
    }
}
