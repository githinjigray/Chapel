namespace Chapel.Chapel;

page 58022 "Scholarship Requisitions List"
{
    ApplicationArea = All;
    Caption = 'Scholarship Requisitions List';
    PageType = List;
    SourceTable = "Scholarship Requisition";
    UsageCategory = Lists;
    CardPageId = "Scholarship Requisition";
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
                field("Requisition Date"; Rec."Requisition Date")
                {
                    ToolTip = 'Specifies the value of the Requisition Date field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Term/Semester"; Rec."Term/Semester")
                {
                    ToolTip = 'Specifies the value of the Term/Semester field.', Comment = '%';
                }
                field("School No."; Rec."School No.")
                {
                    ToolTip = 'Specifies the value of the School No. field.', Comment = '%';
                }
                field("School Name"; Rec."School Name")
                {
                    ToolTip = 'Specifies the value of the School Name field.', Comment = '%';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ToolTip = 'Specifies the value of the Total Amount field.', Comment = '%';
                }
                field("Cheque No."; Rec."Cheque No.")
                {
                    ToolTip = 'Specifies the value of the Cheque No. field.', Comment = '%';
                }
                field("Payment Status"; Rec."Payment Status")
                {
                    ToolTip = 'Specifies the value of the Payment Status field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
            }
        }
    }
}
