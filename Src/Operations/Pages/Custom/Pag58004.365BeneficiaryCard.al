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
                field("School No."; Rec."School No.")
                {
                    ToolTip = 'Specifies the value of the School No. field.', Comment = '%';
                    ApplicationArea = all;
                }
                field("School Name"; Rec."School Name")
                {
                    ToolTip = 'Specifies the value of the School Name field.', Comment = '%';
                    ApplicationArea = all;
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
                    ApplicationArea = all;
                }
                field("Mentor Name"; Rec."Mentor Name")
                {
                    ToolTip = 'Specifies the value of the Mentor Name field.', Comment = '%';
                    ApplicationArea = all;
                }
                field("Sponsor No."; Rec."Sponsor No.")
                {
                    ToolTip = 'Specifies the value of the Sponsor No. field.', Comment = '%';
                    ApplicationArea = all;
                }
                field("Sponsor Name"; Rec."Sponsor Name")
                {
                    ToolTip = 'Specifies the value of the Sponsor Name field.', Comment = '%';
                    ApplicationArea = all;
                }
                field("Externally Sponsored"; Rec."Externally Sponsored")
                {
                    ToolTip = 'Specifies the value of the Externally Sponsored field.', Comment = '%';
                    ApplicationArea = all;
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
