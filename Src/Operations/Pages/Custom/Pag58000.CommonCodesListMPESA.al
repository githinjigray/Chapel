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
            }

        }
    }
}