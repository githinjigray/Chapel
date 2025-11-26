namespace NairobiChapel.NairobiChapel;

page 50900 "Purchase Req. Header API"
{
    APIGroup = '365portal';
    APIPublisher = '365consulting';
    APIVersion = 'v2.0';
    ApplicationArea = All;
    Caption = 'purchaseReqHeaderAPI';
    DelayedInsert = true;
    EntityName = '365PurchaseRequisitionHeader';
    EntitySetName = '365PurchaseRequisitionHeaders';
    PageType = API;
    SourceTable = "Purchase Requisitions";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                
                field(no; Rec."No.")
                {
                    Caption = 'No.';                    
                }
                field(documentDate; Rec."Document Date")
                {
                    Caption = 'Document Date';
                }
                field(requestedReceiptDate; Rec."Requested Receipt Date")
                {
                    Caption = 'Requested Receipt Date';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                }
                field(globalDimension2Code; Rec."Global Dimension 2 Code")
                {
                    Caption = 'Global Dimension 2 Code';
                }
                field(shortcutDimension3Code; Rec."Shortcut Dimension 3 Code")
                {
                    Caption = 'Shortcut Dimension 3 Code';
                }
                field(shortcutDimension4Code; Rec."Shortcut Dimension 4 Code")
                {
                    Caption = 'Shortcut Dimension 4 Code';
                }
                field(employeeNo; Rec."Employee No.")
                {
                    Caption = 'Employee No.';
                }
            }
        }
    }
}
