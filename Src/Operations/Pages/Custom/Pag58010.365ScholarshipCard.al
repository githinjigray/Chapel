namespace Chapel.Chapel;

page 58010 "365 Scholarship Card"
{
    ApplicationArea = All;
    Caption = '365 Scholarship Card';
    PageType = Card;
    SourceTable = "365 Scholarship";

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
                field("Start Date"; Rec."Start Date")
                {
                    ToolTip = 'Specifies the value of the Start Date field.', Comment = '%';
                }
                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Specifies the value of the End Date field.', Comment = '%';
                }
                field("Scholarship Value"; Rec."Scholarship Value")
                {
                    ToolTip = 'Specifies the value of the Scholarship Value field.', Comment = '%';
                }
                field(Institution; Rec.Institution)
                {
                    ToolTip = 'Specifies the value of the Institution field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
            }
            part("Lines"; "365 Scholarship Line")
            {
                ApplicationArea = All;
            }
        }
    }
}
