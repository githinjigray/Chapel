namespace Chapel.Chapel;

using Microsoft.Bank.Reconciliation;
using Microsoft.Bank.BankAccount;
using Microsoft.Finance.Dimension;

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
        // Adds the fields right after the standard Shortcut Dimension 2 Code
        addafter("Shortcut Dimension 2 Code")
        {


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
                Promoted = true;
                promotedCategory = Process;

                trigger OnAction()
                var
                    CommonMpesaCodes: record "Common Codes-MPESA";
                    BankAccReconciliationLine: Record "Bank Acc. Reconciliation Line";
                    BankAccountCard: Record "Bank Account";
                    bankAccReconciliationLinePage: Page "Payment Reconciliation Journal";
                begin
                    bankAccReconciliationLine.Reset();
                    bankAccReconciliationLine.SetRange("Bank Account No.", Rec."Bank Account No.");
                    bankAccReconciliationLine.SetRange("Statement No.", Rec."Statement No.");
                    bankAccReconciliationLine.setrange("Account No.", '');
                    if bankAccReconciliationLine.FindSet() then begin
                        repeat
                            if BankAccountCard.Get(bankAccReconciliationLine."Bank Account No.") then begin
                                if bankAccReconciliationLine."Shortcut Dimension 1 Code" = '' then
                                    bankAccReconciliationLine.validate("Shortcut Dimension 1 Code", BankAccountCard."Global Dimension 1 Code");
                                if bankAccReconciliationLine."Shortcut Dimension 2 Code" = '' then
                                    bankAccReconciliationLine.validate("Shortcut Dimension 2 Code", BankAccountCard."Global Dimension 2 Code");
                            end;
                            CommonMpesaCodes.Reset();
                            CommonMpesaCodes.SetRange(code, bankAccReconciliationLine."Payee Name/Received From");
                            if CommonMpesaCodes.FindFirst() then begin
                                bankAccReconciliationLine.validate("Account Type", CommonMpesaCodes."Account Type");
                                bankAccReconciliationLine.Validate("Account No.", CommonMpesaCodes."Account No.");
                                if commonMpesaCodes."Global Dimension 2 Code" <> '' then
                                    bankAccReconciliationLine.Validate("Shortcut Dimension 2 Code", CommonMpesaCodes."Global Dimension 2 Code");
                                bankAccReconciliationLine.ValidateShortcutDimCode(3, CommonMpesaCodes."Shortcut Dimension 3 Code");
                                bankAccReconciliationLine.ValidateShortcutDimCode(4, CommonMpesaCodes."Shortcut Dimension 4 Code");

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
            action(ValidateDimensions)
            {
                Caption = 'Validate Dimensions';
                ApplicationArea = All;
                Image = SparkleFilled;
                Promoted = true;
                promotedCategory = Process;
                trigger OnAction()
                Var
                    CommonMpesaCodes: record "Common Codes-MPESA";
                    BankAccReconciliationLine: Record "Bank Acc. Reconciliation Line";
                    BankAccountCard: Record "Bank Account";
                begin
                    bankAccReconciliationLine.Reset();
                    bankAccReconciliationLine.SetRange("Bank Account No.", Rec."Bank Account No.");
                    bankAccReconciliationLine.SetRange("Statement No.", Rec."Statement No.");
                    if bankAccReconciliationLine.FindSet() then begin
                        repeat
                            if BankAccountCard.Get(bankAccReconciliationLine."Bank Account No.") then begin
                                if bankAccReconciliationLine."Shortcut Dimension 1 Code" = '' then
                                    bankAccReconciliationLine.validate("Shortcut Dimension 1 Code", BankAccountCard."Global Dimension 1 Code");
                                if bankAccReconciliationLine."Shortcut Dimension 2 Code" = '' then
                                    bankAccReconciliationLine.validate("Shortcut Dimension 2 Code", BankAccountCard."Global Dimension 2 Code");
                            end;
                            CommonMpesaCodes.Reset();
                            CommonMpesaCodes.SetRange(code, bankAccReconciliationLine."Payee Name/Received From");
                            if CommonMpesaCodes.FindFirst() then begin
                                if commonMpesaCodes."Global Dimension 2 Code" <> '' then
                                    bankAccReconciliationLine.Validate("Shortcut Dimension 2 Code", CommonMpesaCodes."Global Dimension 2 Code");
                                bankAccReconciliationLine.ValidateShortcutDimCode(3, CommonMpesaCodes."Shortcut Dimension 3 Code");
                                bankAccReconciliationLine.ValidateShortcutDimCode(4, CommonMpesaCodes."Shortcut Dimension 4 Code");

                                if bankAccReconciliationLine.Modify() then begin

                                end;
                            end;

                        until bankAccReconciliationLine.Next() = 0;
                    end;
                    Message('Validation Completed for Dimensions');
                end;
            }
        }

    }
}
