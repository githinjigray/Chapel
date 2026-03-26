namespace Chapel.Chapel;

page 58008 "365 Shcolarships"
{
    ApplicationArea = All;
    Caption = 'Scholarships';
    PageType = List;
    SourceTable = "365 Scholarship";
    UsageCategory = Lists;
    CardPageId = "365 Scholarship Card";
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ToolTip = 'Specifies the value of the Start Date field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Specifies the value of the End Date field.', Comment = '%';
                    ApplicationArea = All;
                }
                field("Scholarship Value"; Rec."Scholarship Value")
                {
                    ToolTip = 'Specifies the value of the Scholarship Value field.', Comment = '%';
                    ApplicationArea = All;
                }
                field(Institution; Rec.Institution)
                {
                    ToolTip = 'Specifies the value of the Institution field.', Comment = '%';
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                    ApplicationArea = All;
                }
            }
        }
    }
}
