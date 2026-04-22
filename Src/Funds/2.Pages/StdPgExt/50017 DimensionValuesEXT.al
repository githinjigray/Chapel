pageextension 50017 "Dimension Values EXT" extends "Dimension Values"
{
    layout
    {
        addafter(Totaling)
        {

            field("Dimension Value 1"; Rec."Dimension Value 1")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the VAT Registration No. field.', Comment = '%';
            }
            field("Dimension Value 2"; Rec."Dimension Value 2")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the VAT Registration No. field.', Comment = '%';
            }
            field("Dimension Value 3"; Rec."Dimension Value 3")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the VAT Registration No. field.', Comment = '%';
            }
        }
    }
    actions
    {
        addbefore("Indent Dimension Values")
        {
            action("Upload Dimension Values")
            {
                ApplicationArea = all;
                Caption = 'Upload Dimension Values';
                //RunObject = xmlport "Upload Dimension Values";
                ToolTip = 'Upload Dimension Values';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
            }
        }
    }
}
