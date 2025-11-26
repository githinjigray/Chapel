namespace NairobiChapel.NairobiChapel;

page 50901 "Purchase Req. Lines"
{
    APIGroup = '365portal';
    APIPublisher = '365consulting';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'purchaseReqLines';
    DelayedInsert = true;
    EntityName = '365PurchaseRequisitionLine';
    EntitySetName = '365PurchaseRequisitionLines';
    PageType = API;
    SourceTable = "Purchase Requisition Line";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
            }
        }
    }
}
