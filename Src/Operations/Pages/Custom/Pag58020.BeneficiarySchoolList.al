namespace Chapel.Chapel;

page 58020 "Beneficiary School List"
{
    ApplicationArea = All;
    Caption = 'Beneficiary School List';
    PageType = List;
    SourceTable = "Beneficiary School";
    UsageCategory = Lists;
    CardPageId = "Beneficiary School";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("School Name"; Rec."School Name")
                {
                    ToolTip = 'Specifies the value of the School Name field.', Comment = '%';
                }
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the value of the Address field.', Comment = '%';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ToolTip = 'Specifies the value of the Address 2 field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ViewDetails)
            {
                Caption = 'View Payment Details';
                Image = VATExemptionEntries;
                ApplicationArea = All;
                RunObject = Page "365 Beneficiaries List";
                runPageLink = "School No." = field("No.");
            }
        }
    }
}