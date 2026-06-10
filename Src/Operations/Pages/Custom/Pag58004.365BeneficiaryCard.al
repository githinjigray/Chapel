namespace Chapel.Chapel;

page 58004 "365 Beneficiary Card"
{
    ApplicationArea = All;
    Caption = 'Beneficiary Card';
    PageType = Card;
    SourceTable = "365  Beneficiary";

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
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field(Gender; Rec.Gender)
                {
                    ToolTip = 'Specifies the value of the Gender field.', Comment = '%';
                }
                field("School No."; Rec."School No.")
                {
                    ToolTip = 'Specifies the value of the School No. field.', Comment = '%';
                }
                field("School Name"; Rec."School Name")
                {
                    ToolTip = 'Specifies the value of the School Name field.', Comment = '%';
                }

                field("Date of Birth"; Rec."Date of Birth")
                {
                    ToolTip = 'Specifies the value of the Date of Birth field.', Comment = '%';
                }
                field("Current Class/Grade"; Rec."Current Class/Grade")
                {
                    ToolTip = 'Specifies the value of the Current Class/Grade field.', Comment = '%';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the value of the Phone No. field.', Comment = '%';
                }
                field(Email; Rec.Email)
                {
                    ToolTip = 'Specifies the value of the Email field.', Comment = '%';
                }
                field("Amount Received"; Rec."Amount Received")
                {
                    ToolTip = 'Specifies the value of the Amount Received field.', Comment = '%';
                    DrillDownPageId = "365 Scholarship Ledger Entry";
                }
                field("Mentor Name"; Rec."Mentor Name")
                {
                    ToolTip = 'Specifies the value of the Mentor Name field.', Comment = '%';
                }
                field("Sponsor No."; Rec."Sponsor No.")
                {
                    ToolTip = 'Specifies the value of the Sponsor No. field.', Comment = '%';
                }
                field("Sponsor Name"; Rec."Sponsor Name")
                {
                    ToolTip = 'Specifies the value of the Sponsor Name field.', Comment = '%';
                }

            }
            part(Control1; "365 Beneficiary Line")
            {
                ApplicationArea = All;
                SubPageLink = "Beneficiary No." = field("No.");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Sholarship ledger Entries")
            {
                RunObject = page "365 Scholarship Ledger Entry";
                RunPageLink = "Beneficiary No." = field("No.");
                Image = LedgerEntries;
                Promoted = true;
                PromotedCategory = Process;
            }
        }
    }
}
