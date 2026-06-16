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
                field("Doc Name"; Rec."Doc Name")
                {
                    ToolTip = 'Specifies the value of the File Name field.', Comment = '%';
                    Editable = false;
                }
                field("Has Document"; Rec."Has Document")
                {
                    ToolTip = 'Specifies the value of the Uploaded field.', Comment = '%';
                    Editable = false;
                }

            }
        }

    }
    actions
    {
        area(Processing)
        {
            // action(DocAttach)
            // {
            //     ApplicationArea = All;
            //     Caption = 'Attachments';
            //     Image = Attach;
            //     ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

            //     trigger OnAction()
            //     var
            //         DocumentAttachmentDetails: Page "Document Attachment Details";
            //         RecRef: RecordRef;
            //     begin
            //         RecRef.GetTable(Rec);
            //         DocumentAttachmentDetails.OpenForRecRef(RecRef);
            //         DocumentAttachmentDetails.RunModal();
            //     end;
            // }
            action(UploadDoc)
            {
                ApplicationArea = All;
                Caption = 'Upload';
                Image = Attach;
                // Promoted = true;
                // PromotedCategory = Process;
                // PromotedIsBig = true;
                ToolTip = 'Upload a file for the selected document type.';

                trigger OnAction()
                begin
                    UploadDocument();
                end;
            }
            action(DownloadDoc)
            {
                ApplicationArea = All;
                Caption = 'Download';
                Image = Download;
                ToolTip = 'Download the uploaded file for the selected document type.';


                trigger OnAction()
                begin
                    DownloadDocument();
                end;
            }
            action(RemoveDoc)
            {
                ApplicationArea = All;
                Caption = 'Remove';
                Image = Delete;
                ToolTip = 'Remove the uploaded file for the selected document type.';

                trigger OnAction()
                begin
                    RemoveDocument();
                end;
            }
        }

    }
    local procedure UploadDocument()
    var
        FileName: Text;
        FileInStream: InStream;
        DocOutStream: OutStream;
    begin
        if not UploadIntoStream('Select Document to Upload', '', 'All Files (*.*)|*.*', FileName, FileInStream) then
            exit;

        // Re-read record to get the latest DB state before writing the BLOB.
        if not Rec.Find() then begin
            Message('The document record could not be found. Please refresh the page and try again.');
            exit;
        end;

        // Clear any existing BLOB content so the new file starts from a clean state.
        Clear(Rec."Doc Content");
        Rec."Doc Content".CreateOutStream(DocOutStream);
        CopyStream(DocOutStream, FileInStream);
        // Rec."Doc Name" := CopyStr(FileName, 1, MaxStrLen(Rec."Doc Name"));
        Rec."Has Document" := true;
        Rec."Uploaded At" := CurrentDateTime();
        Rec."Uploaded By" := CopyStr(UserId(), 1, MaxStrLen(Rec."Uploaded By"));
        Rec.Modify(true);
        CurrPage.Update(false);
    end;

    local procedure DownloadDocument()
    var
        DocInStream: InStream;
        FileName: Text;
    begin
        if not Rec."Has Document" then begin
            Message('No document has been uploaded for this document type.');
            exit;
        end;
        Rec.CalcFields("Doc Content");
        if not Rec."Doc Content".HasValue then begin
            Message('The document content is empty. Please re-upload the file.');
            exit;
        end;
        Rec."Doc Content".CreateInStream(DocInStream);
        FileName := Rec."Doc Name";
        DownloadFromStream(DocInStream, 'Download Document', '', '', FileName);
    end;

    local procedure RemoveDocument()
    begin
        if not Rec."Has Document" then exit;
        if not Confirm('Remove the uploaded document ''%1''?', false, Rec."Doc Name") then exit;

        Clear(Rec."Doc Content");
        Rec."Doc Name" := '';
        Rec."Has Document" := false;
        Clear(Rec."Uploaded At");
        Rec."Uploaded By" := '';
        Rec.Modify(true);
        CurrPage.Update(false);
    end;
}
