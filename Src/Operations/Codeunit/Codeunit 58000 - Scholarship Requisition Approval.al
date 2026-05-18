codeunit 58000 "Scholarship Req. Approval"
{

    trigger OnRun()
    begin
    end;

    var
        ApprovalEntry: Record "Approval Entry";
        FundsCategoryTxt: Label 'Funds Management';
        FundsCategoryDescriptionTxt: Label 'Funds Management Workflows';
        WorkflowSetup: Codeunit "Workflow Setup";
        EmpReqApprWorkflowCodeTxt: Label 'SC-Requisition';
        EmpReqApprWorkflowDescTxt: Label 'Scholarship Requisition Approval Workflow';


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnAddWorkflowCategoriesToLibrary', '', false, false)]
    local procedure C1502_WorkflowSetup_OnAddWorkflowCategoriesToLibrary()
    begin
        WorkflowSetup.InsertWorkflowCategory(FundsCategoryTxt, FundsCategoryDescriptionTxt);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Setup", 'OnAfterInitWorkflowTemplates', '', false, false)]
    local procedure C1502_OnAfterInitWorkflowTemplates()
    var
        WorkflowSetup: Codeunit "Workflow Setup";
        ScholarshipRequisition: Record "Scholarship Requisition";
        ApprovalEntry: Record "Approval Entry";
        WorkflowTemplate: Record Workflow;
    begin

        WorkflowSetup.InsertTableRelation(DATABASE::"Scholarship Requisition", 0,
          DATABASE::"Approval Entry", ApprovalEntry.FieldNo("Record ID to Approve"));

        InsertScholarshipRequisitionApprovalWorkflowTemplate();
    end;

    local procedure InsertScholarshipRequisitionApprovalWorkflowTemplate()
    var
        WorkflowTemplates: Record Workflow;
        Workflow: Record Workflow;
    begin

        WorkflowTemplates.Reset();
        WorkflowTemplates.SetRange(Code, 'MS-' + EmpReqApprWorkflowCodeTxt);
        WorkflowTemplates.SetRange(Template, true);
        if not WorkflowTemplates.FindFirst() then begin
            WorkflowSetup.InsertWorkflowTemplate(Workflow, EmpReqApprWorkflowCodeTxt,
                      EmpReqApprWorkflowDescTxt, FundsCategoryTxt);
            InsertScholarshipRequisitionApprovalWorkflowDetails(Workflow);
            WorkflowSetup.MarkWorkflowAsTemplate(Workflow);
        end;
    end;

    local procedure InsertScholarshipRequisitionApprovalWorkflowDetails(var Workflow: Record Workflow)
    var
        ScholarshipRequisition: Record "Scholarship Requisition";
        WorkflowStepArgument: Record "Workflow Step Argument";
        BlankDateFormula: DateFormula;
    begin
        WorkflowSetup.InitWorkflowStepArgument(WorkflowStepArgument,
          WorkflowStepArgument."Approver Type"::"Salesperson/Purchaser", WorkflowStepArgument."Approver Limit Type"::"Direct Approver",
          0, '', BlankDateFormula, true);

        WorkflowSetup.InsertDocApprovalWorkflowSteps(Workflow,
          BuildScholarshipRequisitionConditions(ScholarshipRequisition.Status::Open),
          RunWorkflowOnSendScholarshipRequisitionForApprovalCode(),
          BuildScholarshipRequisitionConditions(ScholarshipRequisition.Status::"Pending Approval"),
          RunWorkflowOnCancelScholarshipRequisitionApprovalRequestCode(),
          WorkflowStepArgument, true);
    end;

    procedure BuildScholarshipRequisitionConditions(Status: Option Open,"Pending Approval",Approved): Text
    var
        ScholarshipRequisition: Record "Scholarship Requisition";
        ScholarshipRequisitionTypeCondnTxt: Label '<?xml version="1.0" encoding="utf-8" standalone="yes"?><ReportParameters><DataItems><DataItem name="Scholarship Requisition">%1</DataItem><DataItem name="Scholarship Requisition Line">%2</DataItem></DataItems></ReportParameters>';
    begin
        ScholarshipRequisition.SetRange(Status, Status);
        exit(StrSubstNo(ScholarshipRequisitionTypeCondnTxt, WorkflowSetup.Encode(ScholarshipRequisition.GetView(false))));
    end;

    procedure CheckScholarshipRequisitionApprovalWorkflowEnabled(var ScholarshipRequisition: Record "Scholarship Requisition"): Boolean
    var
        NoWorkflowEnabledErr: Label 'No approval workflow for this record type is enabled.';
    begin
        if not IsScholarshipRequisitionApprovalWorkflowEnabled(ScholarshipRequisition) then
            Error(NoWorkflowEnabledErr);
        exit(true);
    end;

    local procedure IsScholarshipRequisitionApprovalWorkflowEnabled(var ScholarshipRequisition: Record "Scholarship Requisition"): Boolean
    var
        WorkflowManagement: Codeunit "Workflow Management";
    begin
        exit(WorkflowManagement.CanExecuteWorkflow(ScholarshipRequisition, RunWorkflowOnSendScholarshipRequisitionForApprovalCode));
    end;

    [IntegrationEvent(false, false)]
    procedure OnBeforeSendScholarshipRequisitionForApproval(var ScholarshipRequisition: Record "Scholarship Requisition")
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnSendScholarshipRequisitionForApproval(var ScholarshipRequisition: Record "Scholarship Requisition")
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnAfterSendScholarshipRequisitionForApproval(var ScholarshipRequisition: Record "Scholarship Requisition")
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnBeforeCancelScholarshipRequisitionForApproval(var ScholarshipRequisition: Record "Scholarship Requisition")
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnCancelScholarshipRequisitionForApproval(var ScholarshipRequisition: Record "Scholarship Requisition")
    begin
    end;

    [IntegrationEvent(false, false)]
    procedure OnAfterCancelScholarshipRequisitionForApproval(var ScholarshipRequisition: Record "Scholarship Requisition")
    begin
    end;

    local procedure RunWorkflowOnSendScholarshipRequisitionForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendScholarshipRequisitionForApproval'));
    end;

    local procedure RunWorkflowOnCancelScholarshipRequisitionApprovalRequestCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCancelScholarshipRequisitionApprovalRequest'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 58000, 'OnSendScholarshipRequisitionForApproval', '', false, false)]
    local procedure RunWorkflowOnSendScholarshipRequisitionForApproval(var ScholarshipRequisition: Record "Scholarship Requisition")
    var
        WorkflowManagement: Codeunit "Workflow Management";
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnSendScholarshipRequisitionForApprovalCode, ScholarshipRequisition);
    end;

    [EventSubscriber(ObjectType::Codeunit, 58000, 'OnCancelScholarshipRequisitionForApproval', '', false, false)]
    local procedure RunWorkflowOnCancelScholarshipRequisitionApprovalRequest(var ScholarshipRequisition: Record "Scholarship Requisition")
    var
        WorkflowManagement: Codeunit "Workflow Management";
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCancelScholarshipRequisitionApprovalRequestCode, ScholarshipRequisition);
    end;

    [EventSubscriber(ObjectType::Codeunit, 1520, 'OnAddWorkflowEventsToLibrary', '', false, false)]
    local procedure AddEventsToLibrary()
    var
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendScholarshipRequisitionForApprovalCode,
                                    DATABASE::"Scholarship Requisition", 'Approval of a Scholarship Requisition document is requested.', 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCancelScholarshipRequisitionApprovalRequestCode,
                                    DATABASE::"Scholarship Requisition", 'An approval request for a Scholarship Requisition document is canceled.', 0, false);
    end;

    [EventSubscriber(ObjectType::Codeunit, 1520, 'OnAddWorkflowEventPredecessorsToLibrary', '', false, false)]
    local procedure AddEventPredecessorsToLibrary(EventFunctionName: Code[128])
    var
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode,
                                                  RunWorkflowOnSendScholarshipRequisitionForApprovalCode);
        WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnRejectApprovalRequestCode,
                                                  RunWorkflowOnSendScholarshipRequisitionForApprovalCode);
        WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnDelegateApprovalRequestCode,
                                                  RunWorkflowOnSendScholarshipRequisitionForApprovalCode);
    end;

    [EventSubscriber(ObjectType::Codeunit, 1520, 'OnAddWorkflowTableRelationsToLibrary', '', false, false)]
    local procedure AddTableRelationsToLibrary()
    var
        WorkflowSetup: Codeunit "Workflow Setup";
    begin
        WorkflowSetup.InsertTableRelation(DATABASE::"Scholarship Requisition", 0,
                                          DATABASE::"Approval Entry", ApprovalEntry.FieldNo("Record ID to Approve"));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1521, 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    local procedure AddResponsesToLibrary()
    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, 1521, 'OnAddWorkflowResponsePredecessorsToLibrary', '', false, false)]
    local procedure AddResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])
    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
    begin
        WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode,
                                                        RunWorkflowOnSendScholarshipRequisitionForApprovalCode);
        WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CreateApprovalRequestsCode,
                                                        RunWorkflowOnSendScholarshipRequisitionForApprovalCode);
        WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode,
                                                        RunWorkflowOnSendScholarshipRequisitionForApprovalCode);
        WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode,
                                                        RunWorkflowOnCancelScholarshipRequisitionApprovalRequestCode);//To Ammend
        WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                                                        RunWorkflowOnCancelScholarshipRequisitionApprovalRequestCode);
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnPopulateApprovalEntryArgument', '', false, false)]
    local procedure PopulateApprovalEntryArgument(var RecRef: RecordRef; var ApprovalEntryArgument: Record "Approval Entry"; WorkflowStepInstance: Record "Workflow Step Instance")
    var
        GeneralLedgerSetup: Record "General Ledger Setup";
        ScholarshipRequisition: Record "Scholarship Requisition";
        CurrencyCode: Code[10];
        DocumentTypeTxt: Label '%1 Requisition';
        ApprovalDescriptionTxt: Label 'Requisition of %1:%2 to %3.';
    begin
        GeneralLedgerSetup.Reset;
        GeneralLedgerSetup.Get;
        GeneralLedgerSetup.TestField("LCY Code");

        case RecRef.Number of
            DATABASE::"Scholarship Requisition":
                begin
                    RecRef.SetTable(ScholarshipRequisition);
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::" ";
                    ApprovalEntryArgument."Document No." := ScholarshipRequisition."No.";
                    ApprovalEntryArgument."Document Source" := ScholarshipRequisition."No.";
                    ScholarshipRequisition.CalcFields("Total Amount");
                    ApprovalEntryArgument.Amount := ScholarshipRequisition."Total Amount";
                    ApprovalEntryArgument."Amount (LCY)" := ScholarshipRequisition."Total Amount";
                    ApprovalEntryArgument."Currency Code" := CurrencyCode;
                    ApprovalEntryArgument.Description := 'Sholarship Requisition Approval';
                    //ApprovalEntryArgument."Document Source" := ScholarshipRequisition."Bank Account No.";
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 1521, 'OnOpenDocument', '', false, false)]
    local procedure OpenDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        ScholarshipRequisition: Record "Scholarship Requisition";
    begin
        case RecRef.Number of
            DATABASE::"Scholarship Requisition":
                begin
                    RecRef.SetTable(ScholarshipRequisition);
                    ScholarshipRequisition.Validate(Status, ScholarshipRequisition.Status::Open);
                    ScholarshipRequisition.Modify(true);
                    Handled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnSetStatusToPendingApproval', '', false, false)]
    local procedure SetStatusToPendingApproval(RecRef: RecordRef; var Variant: Variant; var IsHandled: Boolean)
    var
        ScholarshipRequisition: Record "Scholarship Requisition";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of
            DATABASE::"Scholarship Requisition":
                begin
                    RecRef.SetTable(ScholarshipRequisition);
                    ScholarshipRequisition.Validate(Status, ScholarshipRequisition.Status::"Pending Approval");
                    ScholarshipRequisition.Modify(true);
                    Variant := ScholarshipRequisition;
                    IsHandled := true;
                end;
        end;
        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, 1521, 'OnReleaseDocument', '', false, false)]
    local procedure ReleaseDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        ScholarshipRequisition: Record "Scholarship Requisition";
    begin
        case RecRef.Number of
            DATABASE::"Scholarship Requisition":
                begin
                    RecRef.SetTable(ScholarshipRequisition);
                    ScholarshipRequisition.Validate(Status, ScholarshipRequisition.Status::Approved);
                    if ScholarshipRequisition.Modify(true) then
                        OnAfterReleaseDocument(ScholarshipRequisition);
                    Handled := true;
                end;
        end;
        Handled := true;
    end;

    [BusinessEvent(false)]
    local procedure OnAfterReleaseDocument(var ScholarshipRequisition: Record "Scholarship Requisition")
    begin
    end;

    //[EventSubscriber(ObjectType::Codeunit, 51535079, 'OnRejectDocument', '', false, false)]
    local procedure RejectDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        ScholarshipRequisition: Record "Scholarship Requisition";
    begin
        case RecRef.Number of
            DATABASE::"Scholarship Requisition":
                begin
                    RecRef.SetTable(ScholarshipRequisition);
                    ScholarshipRequisition.Validate(Status, ScholarshipRequisition.Status::Open);
                    ScholarshipRequisition.Modify(true);
                    Handled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 700, 'OnAfterGetPageID', '', false, false)]
    local procedure GetPageID(RecordRef: RecordRef; var PageID: Integer)
    var
        ScholarshipRequisition: Record "Scholarship Requisition";
    begin
        case RecordRef.Number of
            DATABASE::"Scholarship Requisition":
                begin
                    RecordRef.SetTable(ScholarshipRequisition);
                    PageID := PAGE::"Scholarship Requisition";
                end;
        end;
    end;

    //[EventSubscriber(ObjectType::Codeunit, 51535002, 'OnBeforeSendRequisitionForApproval', '', false, false)]
    local procedure CheckFieldsBeforeApproval(var ScholarshipRequisition: Record "Scholarship Requisition")
    begin
    end;
}

