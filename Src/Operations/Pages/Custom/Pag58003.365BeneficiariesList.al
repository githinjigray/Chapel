namespace Chapel.Chapel;

page 58003 "365 Beneficiaries List"
{
    ApplicationArea = All;
    Caption = 'Beneficiaries List';
    PageType = List;
    SourceTable = "365  Beneficiary";
    UsageCategory = Lists;
    CardPageId = "365 Beneficiary Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                    ApplicationArea = all;
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                    ApplicationArea = all;
                }
                field(Gender; Rec.Gender)
                {
                    ToolTip = 'Specifies the value of the Gender field.', Comment = '%';
                    ApplicationArea = all;
                }
                field("School Name"; Rec."School Name")
                {
                    ToolTip = 'Specifies the value of the School Name field.', Comment = '%';
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ToolTip = 'Specifies the value of the Date of Birth field.', Comment = '%';
                    ApplicationArea = all;
                }
                field("Current Class/Grade"; Rec."Current Class/Grade")
                {
                    ToolTip = 'Specifies the value of the Current Class/Grade field.', Comment = '%';
                    ApplicationArea = all;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the value of the Phone No. field.', Comment = '%';
                    ApplicationArea = all;
                }
                field(Email; Rec.Email)
                {
                    ToolTip = 'Specifies the value of the Email field.', Comment = '%';
                    ApplicationArea = all;
                }
                field("Amount Received"; Rec."Amount Received")
                {
                    ToolTip = 'Specifies the value of the Amount Received field.', Comment = '%';
                    DrillDownPageId = "365 Scholarship Ledger Entry";
                }
            }
        }
    }
}
