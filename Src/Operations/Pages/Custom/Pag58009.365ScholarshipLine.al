namespace Chapel.Chapel;

page 58009 "365 Scholarship Line"
{
    ApplicationArea = All;
    Caption = '365 Scholarship Line';
    PageType = ListPart;
    SourceTable = "365 Scholarship Line";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Beneficiary No."; Rec."Beneficiary No.")
                {
                    ToolTip = 'Specifies the value of the Beneficiary No. field.', Comment = '%';
                }
                field(beneficiaryName; Rec.beneficiaryName)
                {
                    ToolTip = 'Specifies the value of the Beneficiary Name field.', Comment = '%';
                }
            }
        }
    }
}
