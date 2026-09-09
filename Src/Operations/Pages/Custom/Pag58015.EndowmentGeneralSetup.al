namespace Chapel.Chapel;

page 58015 "Endowment General Setup"
{
    ApplicationArea = All;
    Caption = 'Endowment General Setup';
    PageType = List;
    SourceTable = "Endowment General Setup";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Endowment Beneficiary Account"; Rec."Endowment Beneficiary Account")
                {
                    ToolTip = 'Specifies the value of the Endowment Beneficiary Account field.', Comment = '%';
                    applicationArea = All;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ToolTip = 'Specifies the value of the Account Name field.', Comment = '%';
                    applicationArea = All;
                }
                field("Scholarship Account No."; Rec."Scholarship Account No.")
                {
                    ToolTip = 'Specifies the value of the Scholarship Account No. field.', Comment = '%';
                    applicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.', Comment = '%';
                    applicationArea = All;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.', Comment = '%';
                    applicationArea = All;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.', Comment = '%';
                    applicationArea = All;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.', Comment = '%';
                    applicationArea = All;
                }
            }
        }
    }
}
