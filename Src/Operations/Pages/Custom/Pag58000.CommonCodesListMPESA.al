namespace Chapel.Chapel;

page 58000 "Common Codes List - MPESA"
{
    ApplicationArea = All;
    Caption = 'Common Codes List - MPESA';
    SourceTable = "Common Codes-MPESA";
    UsageCategory = Lists;
    PageType = List;
    CardPageId = "Common Codes Card";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    Caption = 'Code';
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Description';
                    ApplicationArea = all;
                }
                field("Type"; Rec."Account Type")
                {
                    Caption = 'Type';
                    ApplicationArea = all;
                }
                field("Account No."; Rec."Account No.")
                {
                    Caption = 'Account No.';
                    ApplicationArea = all;
                }
                field("Account Name"; Rec."Account Name")
                {
                    Caption = 'Account Name';
                    ApplicationArea = all;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    applicationArea = all;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.', Comment = '%';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.', Comment = '%';
                    ApplicationArea = all;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.', Comment = '%';
                    ApplicationArea = all;
                }
            }

        }
    }
}