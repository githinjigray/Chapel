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
                }
                field("Account Name"; Rec."Account Name")
                {
                    ToolTip = 'Specifies the value of the Account Name field.', Comment = '%';
                }
            }
        }
    }
}
