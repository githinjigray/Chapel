namespace Chapel.Chapel;

using Microsoft.Sales.Setup;

pageextension 50044 "365 Sales & Receivables Setup" extends "Sales & Receivables Setup"
{
    layout
    {
        addlast("Number Series")
        {

            field("Benficiary No."; Rec."Benficiary No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Benficiary No. field.', Comment = '%';
            }
            field("Guardian No."; Rec."Guardian No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Guardian No. field.', Comment = '%';
            }
            field("Scholarship No."; Rec."Scholarship No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Scholarship No. field.', Comment = '%';
            }
            field("Sponsor No."; Rec."Sponsor No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sponsor No. field.', Comment = '%';
            }
            field("Activity No."; Rec."Activity No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Activity No. field.', Comment = '%';
            }
        }

    }
}
