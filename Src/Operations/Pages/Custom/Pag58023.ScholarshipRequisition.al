namespace Chapel.Chapel;

using System.Automation;
using Microsoft.Foundation.Attachment;
using Microsoft.EServices.EDocument;

page 58023 "Scholarship Requisition"
{
    ApplicationArea = All;
    Caption = 'LOGOS Requisition';
    PageType = Card;
    SourceTable = "Scholarship Requisition";

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
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.', Comment = '%';
                }
            }
            part(Control1; "Scholarship Requisition Line")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
            }
        }
        area(factboxes)
        {
            systempart(Control52; Links)
            {
                ApplicationArea = RecordLinks;
            }

            part(ApprovalFactBox; "Approval FactBox")
            {
                ApplicationArea = Advanced;
            }
            part(IncomingDocAttachFactBox; "Incoming Doc. Attach. FactBox")
            {
                ApplicationArea = Advanced;
                ShowFilter = false;
                Visible = false;
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                ApplicationArea = Suite;
                Editable = false;
                Enabled = false;
                ShowFilter = false;
                Visible = ShowWorkflowStatusG;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Approvals)
            {
                ApplicationArea = All;
                Caption = 'Approvals', comment = 'ENU="Approvals"';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Approvals;
                ToolTip = 'View a list of the records that are waiting to be approved. For example, you can see who requested the record to be approved, when it was sent, and when it is due to be approved.';
                RunObject = page "Approval Entries-Modified";
                RunPageLink = "Document No." = field("No.");
                trigger OnAction()
                begin

                end;
            }
            action("Send Approval Request")
            {
                ApplicationArea = All;
                Caption = 'Send Approval Request', comment = 'ENU="Send Approval Request"';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = SendApprovalRequest;

                trigger OnAction()
                begin
                    ScholarshipRequisitionLine.Reset();
                    ScholarshipRequisitionLine.SetRange("Document No.", Rec."No.");
                    if ScholarshipRequisitionLine.FindSet() then begin
                        repeat
                            ScholarshipRequisitionLine.TestField(Amount);
                        until ScholarshipRequisitionLine.Next() = 0;
                    end;
                    IF ScholarshipApprovalManager.CheckScholarshipRequisitionApprovalWorkflowEnabled(Rec) THEN
                        ScholarshipApprovalManager.OnSendScholarshipRequisitionForApproval(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = All;
                Caption = 'Cancel Approval Request', comment = 'ENU="Cancel Approval Request"';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = CancelApprovalRequest;

                trigger OnAction()
                begin
                    ScholarshipApprovalManager.OnCancelScholarshipRequisitionForApproval(Rec);
                    WorkflowWebhookMgt.FindAndCancel(Rec.RECORDID);
                end;
            }
        }
    }
    var
        ScholarshipApprovalManager: Codeunit "Scholarship Req. Approval";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
        ScholarshipRequisitionLine: Record "Scholarship Requisition Line";
        OfficeMgt: Codeunit Microsoft.CRM.Outlook."Office Management";
        ShowWorkflowStatusG: Boolean;
        StatusStyleTxt: Text;
        HasIncomingDocument: Boolean;
        DocAmountEnable: Boolean;
        DocAmountsEditable: Boolean;
        IncomingDocEmailAttachmentEnabled: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        PurchaseDocCheckFactboxVisible: Boolean;


    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance();
        CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);
        CurrPage.ApprovalFactBox.PAGE.UpdateApprovalEntriesFromSourceRecord(Rec.RecordId);
        ShowWorkflowStatusG := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(Rec.RecordId);
        StatusStyleTxt := Rec.GetStatusStyleText();
        if rec.Status <> rec.Status::Open then
            CurrPage.Editable(false);
    end;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        DocumentErrorsMgt: Codeunit Microsoft.Utilities."Document Errors Mgt.";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    begin
        // HasIncomingDocument := Rec."Incoming Document Entry No." <> 0;
        // DocAmountEnable := PurchSetup.ShouldDocumentTotalAmountsBeChecked(Rec);
        // DocAmountsEditable := PurchSetup.CanDocumentTotalAmountsBeEdited(Rec);
        // SetExtDocNoMandatoryCondition();
        // SetPostingGroupEditable();

        IncomingDocEmailAttachmentEnabled := OfficeMgt.EmailHasAttachments();
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);

        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);


        WorkflowWebhookMgt.GetCanRequestAndCanCancel(Rec.RecordId, CanRequestApprovalForFlow, CanCancelApprovalForFlow);
        PurchaseDocCheckFactboxVisible := DocumentErrorsMgt.BackgroundValidationEnabled();
    end;
}
