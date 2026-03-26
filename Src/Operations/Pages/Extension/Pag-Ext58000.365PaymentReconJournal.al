namespace Chapel.Chapel;

using Microsoft.Bank.Reconciliation;
using Microsoft.Bank.BankAccount;

pageextension 58000 "365 Payment Recon. Journal" extends "Payment Reconciliation Journal"
{
    layout
    {
        addafter("Transaction Text")
        {

            field("Payee Name/Received From"; Rec."Payee Name/Received From")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Payee Name/Received From field.', Comment = '%';
            }
        }
    }
    actions
    {
        addafter(Details)
        {
            action(CommonCodes)
            {
                Caption = 'Validate Common Codes-MPESA';
                ApplicationArea = All;
                Image = ValueLedger;

                trigger OnAction()
                var
                    CommonMpesaCodes: record "Common Codes-MPESA";
                    BankAccReconciliationLine: Record "Bank Acc. Reconciliation Line";
                    BankAccountCard: Record "Bank Account";
                begin
                    bankAccReconciliationLine.Reset();
                    bankAccReconciliationLine.SetRange("Bank Account No.", Rec."Bank Account No.");
                    bankAccReconciliationLine.SetRange("Statement No.", Rec."Statement No.");
                    bankAccReconciliationLine.setrange("Account No.", '');
                    if bankAccReconciliationLine.FindSet() then begin
                        repeat
                            if BankAccountCard.Get(bankAccReconciliationLine."Bank Account No.") then begin
                                bankAccReconciliationLine.validate("Shortcut Dimension 1 Code", BankAccountCard."Global Dimension 1 Code");
                                bankAccReconciliationLine.validate("Shortcut Dimension 2 Code", BankAccountCard."Global Dimension 2 Code");
                            end;
                            CommonMpesaCodes.Reset();
                            CommonMpesaCodes.SetRange(code, bankAccReconciliationLine."Transaction Text");
                            if CommonMpesaCodes.FindFirst() then begin
                                bankAccReconciliationLine.validate("Account Type", CommonMpesaCodes."Account Type");
                                bankAccReconciliationLine.Validate("Account No.", CommonMpesaCodes."Account No.");
                                if bankAccReconciliationLine.Modify() then begin
                                    if bankAccReconciliationLine.Difference <> 0 then
                                        bankAccReconciliationLine.TransferRemainingAmountToAccount();
                                end;
                            end;

                        until bankAccReconciliationLine.Next() = 0;
                    end;
                    Message('Validation Completed for Common Codes-MPESA');
                end;
            }
        }
    }
}
