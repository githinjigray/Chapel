namespace Chapel.Chapel;

page 58013 "365 Sponsor Card"
{
    ApplicationArea = All;
    Caption = 'Sponsor Card';
    PageType = Card;
    SourceTable = "365 Sponsor";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Phone No. field.', Comment = '%';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Email field.', Comment = '%';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Gender field.', Comment = '%';
                }
                field(Occupation; Rec.Occupation)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Occupation field.', Comment = '%';
                }
            }
        }
    }
}
