pageextension 50027 "Requests to Approve EXT" extends "Requests to Approve"
{
    layout
    {
        addafter(Details)
        {
            // field(Description; Rec.Description)
            // {
            //     ApplicationArea = all;
            //     ToolTip = 'Additional detailes on what is to be approved';
            // }
            field(EmployeeID; EmployeeID)
            {
                ApplicationArea = all;
                ToolTip = 'Employee ID';
            }
            field(EmployeeName; EmployeeName)
            {
                ApplicationArea = all;
                ToolTip = 'Employee Name';
            }
            field(Dimension1Code; Dimension1Code)
            {
                ApplicationArea = all;
                ToolTip = 'Dimension 1 Code';
            }
            field(RequestDescription; RequestDescription)
            {
                ApplicationArea = all;
                ToolTip = 'Request Description';
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        LedgerEntryExtensionsions.GetRelatedDocumentInfo(Rec, EmployeeID, EmployeeName, Dimension1Code, RequestDescription);
    end;

    trigger OnOpenPage()
    begin


    end;

    var
        EmployeeID: Text;
        EmployeeName: Text;
        Dimension1Code: Text;
        RequestDescription: Text;
        LedgerEntryExtensionsions: Codeunit "Ledger Entry Extensionsions";
}
