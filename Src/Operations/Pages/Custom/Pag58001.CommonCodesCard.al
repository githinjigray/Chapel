namespace Chapel.Chapel;

page 58001 "Common Codes Card"
{
    ApplicationArea = All;
    Caption = 'Common Codes Card';
    PageType = Card;
    SourceTable = "Common Codes-MPESA";
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
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
