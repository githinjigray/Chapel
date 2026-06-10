namespace Chapel.Chapel;
using Microsoft.Foundation.Attachment;

page 58024 "Scholarship Requisition Line"
{
    ApplicationArea = All;
    Caption = 'Scholarship Requisition Line';
    PageType = ListPart;
    SourceTable = "Scholarship Requisition Line";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Beneficiary No."; Rec."Beneficiary No.")
                {
                    ToolTip = 'Specifies the value of the Beneficiary No. field.', Comment = '%';
                }
                field("Beneficiray Name"; Rec."Beneficiray Name")
                {
                    ToolTip = 'Specifies the value of the Beneficiray Name field.', Comment = '%';
                }
                field("Sponsor No."; Rec."Sponsor No.")
                {
                    ToolTip = 'Specifies the value of the Sponsor No. field.', Comment = '%';
                }
                field("Sponsor Name"; Rec."Sponsor Name")
                {
                    ToolTip = 'Specifies the value of the Sponsor Name field.', Comment = '%';
                }

                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }

            }
        }

    }
    actions
    {
        area(Processing)
        {
            action(DocAttach)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal();
                end;
            }
        }
    }
}
