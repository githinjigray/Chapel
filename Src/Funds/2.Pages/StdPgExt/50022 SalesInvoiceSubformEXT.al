pageextension 50022 "Sales Invoice Subform EXT" extends "Sales Invoice Subform"
{
    layout
    {
        modify("VAT Prod. Posting Group")
        {
            Visible = true;
        }
        addbefore(Type)
        {
            field("Service Code"; Rec."Service Code")
            {
                ApplicationArea = all;
                ToolTip = 'Service Code';
            }
            field("Service Description"; Rec."Service Description")
            {
                ApplicationArea = all;
                ToolTip = 'Service Description';
            }
        }

        addafter("Shortcut Dimension 2 Code")
        {

        }
    }
}
